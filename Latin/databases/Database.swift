//
//  Database.swift
//  Profile sql
//
//  Created by Kenan Palmer on 24/10/2020.
//

import Foundation
import SQLite3
// the data base class that will hold the pointer to the database, and how to do all the statemenets
class SQLiteDatabase: ObservableObject {
    // the pointer to the database
    private let dbPointer: OpaquePointer?
    private let profileQueryStatementString = "SELECT * FROM Profile WHERE ;"
    // the last error message from the data base
    fileprivate var errorMessage: String {
        if let errorPointer = sqlite3_errmsg(dbPointer) {
            let errorMessage = String(cString: errorPointer)
            return errorMessage
        } else {
            return "No error message provided from sqlite."
        }
    }
    
    private init(dbPointer: OpaquePointer?) {
        self.dbPointer = dbPointer
    }
    
    //called when a database is deinitalised
    deinit {
        // must close the pointer when its not used
        sqlite3_close(dbPointer)
    }
    
    // opens the database and returns a databse class connected to that database
    static func open(path: String) throws -> SQLiteDatabase {
        var db: OpaquePointer?
        // 1 check to see if there was a successful attempt to open the databse
        if sqlite3_open(path, &db) == SQLITE_OK {
            // 2 returns a SQLiteDatabase object, with a filepointing to the databse
            return SQLiteDatabase(dbPointer: db)
        } else {
            // 3 defer runs after everything, so the database that wasnt found will be closed at the end
            defer {
                if db != nil {
                    sqlite3_close(db)
                }
            }
            // throws an error with an error message from sqlite
            if let errorPointer = sqlite3_errmsg(db) {
                let message = String(cString: errorPointer)
                throw SQLiteError.OpenDatabase(message: message)
            } else {
                // throws error with message not from sqlite
                throw SQLiteError
                .OpenDatabase(message: "No error message provided from sqlite.")
            }
        }
    }
    // when every you want to give the databses a statement, you should prepare thestatment then pass into it the values before you run it
    func prepareStatement(sqlStatement: String) throws -> OpaquePointer? {
        var statement: OpaquePointer?
        // prepares the statment and will throw error when it goes wrong
        guard sqlite3_prepare_v2(dbPointer, sqlStatement, -1, &statement, nil)
                == SQLITE_OK else {
            print(errorMessage)
            throw SQLiteError.Prepare(message: errorMessage)
        }
        return statement
    }
    
    // creates a new table
    func createTable(table: SQLTable.Type) throws {
        let createTableStatement = try prepareStatement(sqlStatement: table.createStatement)
        // will close the statement at the end no matter what
        defer {
            sqlite3_finalize(createTableStatement)
        }
        // throws error massage if table isnt created
        guard sqlite3_step(createTableStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("\(table) table created.")
    }
    
    //deletes table
    func dropTable(table: SQLTable.Type) throws{
        //1
        let dropTableStatement = try prepareStatement(sqlStatement: table.dropStatement)
        defer {
            sqlite3_finalize(dropTableStatement)
        }
        guard sqlite3_step(dropTableStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("\(table) table dropped.")
    }
    
    // insert a profile
    func insertProfile(profile: Profile, insertSQL : String) throws {
        let insertStatement = try prepareStatement(sqlStatement: insertSQL)
        // will always finalize the pointer
        defer {
            sqlite3_finalize(insertStatement)
        }
        guard
            sqlite3_bind_int(insertStatement, 1, profile.id) == SQLITE_OK  &&
                sqlite3_bind_text(insertStatement, 2, profile.Username.utf8String, -1, nil) == SQLITE_OK &&
                sqlite3_bind_text(insertStatement, 3, profile.Password.utf8String, -1, nil)
                == SQLITE_OK
        else {
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard sqlite3_step(insertStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("Successfully inserted row.")
    }
    //returns all the usernames in the profiles table
    func GetUsernames()->String?{
        let querysql = Profile.GetUsernamesQueryStatement
        guard let queryStatement = try? prepareStatement(sqlStatement: querysql) else{
            return nil
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        guard let result = sqlite3_column_text(queryStatement, 0) else{
            return nil
        }
        let Usernames = String(cString: result) as String
        return Usernames
    }
    //returns true if password given matches table
    func CheckPassword(Username: NSString, Password: NSString) -> Bool?{
        let querySql = Profile.CheckPasswordQueryStatement
        guard let queryStatement = try? prepareStatement(sqlStatement: querySql) else {
            return nil
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        guard sqlite3_bind_text(queryStatement, 1, Username.utf8String, -1, nil) == SQLITE_OK else {
            return nil
        }
        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            return nil
        }
        guard let result = sqlite3_column_text(queryStatement, 0) else{
            print("Cannot find username")
            return false
        }
        let truePassword = String(cString: result) as String
        if Password as String == truePassword{
            return true
        }
        return false
    }
    //returns a profile
    func GetProfile(id: Int32) -> Profile? {
        let querySql = "SELECT * FROM Profiles WHERE id = ?;"
        guard let queryStatement = try? prepareStatement(sqlStatement: querySql) else {
            return nil
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        guard sqlite3_bind_int(queryStatement, 1, id) == SQLITE_OK else {
            return nil
        }
        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            return nil
        }
        // ID COLUMN
        let id = sqlite3_column_int(queryStatement, 0)
        
        //USERNAME COLUMN
        guard let queryResultCol1 = sqlite3_column_text(queryStatement, 1) else {
            print("Query result is nil.")
            return nil
        }
        let Username = String(cString: queryResultCol1) as NSString
        
        // PASSWORD COLUMN
        guard let queryResultCol2 = sqlite3_column_text(queryStatement, 2) else {
            print("Query result is nil.")
            return nil
        }
        let Password = String(cString: queryResultCol2) as NSString


        return Profile(id: id, Username: Username, Password: Password)
    }
    //
    func  QueryProfile(columns:[String]=["*"]){
        var columnString:String = ""
        for column in columns{
            columnString = (String(columnString) + "," + column)
        }
        let queryStatementString:String = profileQueryStatementString.replacingOccurrences(of: "?", with: columnString)
        var queryStatement: OpaquePointer?
        // 1 prepare the query statement
        if sqlite3_prepare_v2(dbPointer, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
          // 2 step the query statement
          if sqlite3_step(queryStatement) == SQLITE_ROW {
            // 3 id is the frist column, should normally have the id in the query
            let id = sqlite3_column_int(queryStatement, 0)
            // 4 the next column will have a different forms depending on the query
            guard let queryResultCol1 = sqlite3_column_text(queryStatement, 1) else {
              print("Query result is nil")
              return
            }
            let name = String(cString: queryResultCol1)
            // 5 prints id and name
            print("\nQuery Result:")
            print("\(id) | \(name)")
        } else {
            print("\nQuery returned no results.")
        }
        } else {
          let errorMessage = String(cString: sqlite3_errmsg(dbPointer))
          print("\nQuery is not prepared \(errorMessage)")
        }
        sqlite3_finalize(queryStatement)
      }
    func GetErrorMessage()->String{
        return errorMessage
    }
}
// the errors that will be throws
enum SQLiteError: Error {
    case OpenDatabase(message: String)
    case Prepare(message: String)
    case Step(message: String)
    case Bind(message: String)
}
