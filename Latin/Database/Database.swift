//
//  Database.swift
//  Latin
//
//  Created by Kenan Palmer on 22/11/2020.
//

import Foundation
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
        guard sqlite3_prepare_v2(dbPointer,sqlStatement, -1, &statement, nil)
                == SQLITE_OK else {
            print(errorMessage)
            throw SQLiteError.Prepare(message: errorMessage)
        }
        return statement
    }
    
    // creates a new table once given the statement
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
    
    //deletes table once statment given
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
    
    //insert a from into the formTable
    func insertForm(part1:String,part2:String,part3:String, part4:String, part5:String,part6: String, wordType:WordTypes) throws {
        let insertStatement = try prepareStatement(sqlStatement: Form.insertStatement)
        // will always finalize the pointer
        defer {
            sqlite3_finalize(insertStatement)
        }
        guard
            sqlite3_bind_null(insertStatement, 1) == SQLITE_OK  &&
            sqlite3_bind_text(insertStatement, 2, part1, -1, nil) == SQLITE_OK &&
            sqlite3_bind_text(insertStatement, 3, part2, -1, nil) == SQLITE_OK &&
            sqlite3_bind_text(insertStatement, 4, part3, -1, nil) == SQLITE_OK &&
            sqlite3_bind_text(insertStatement, 5, part4, -1, nil) == SQLITE_OK &&
            sqlite3_bind_text(insertStatement, 6, part5, -1, nil) == SQLITE_OK &&
            sqlite3_bind_text(insertStatement, 7, part6, -1, nil) == SQLITE_OK &&
            sqlite3_bind_text(insertStatement, 8, wordType.rawValue, -1, nil) == SQLITE_OK
            
        else {
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard sqlite3_step(insertStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
    }
    // insert a profile when a new one is created
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
        print("Successfully inserted row into the profile table.")
    }
    //insert a row into the onfidence table every time a person attemts an unseen combination of word and form
    func insertConfidence(result:Question, profileID:Int32, insertSQL : String) throws{
        let resultNum: Int
        if result.isCorrect{
            resultNum = 1 //1 for correct 0 for inncorrect
        }else{
            resultNum = 0
        }
        let insertStatement = try prepareStatement(sqlStatement: insertSQL)
        // will always finalize the pointer
        defer {
            sqlite3_finalize(insertStatement)
        }
        guard
            sqlite3_bind_null(insertStatement, 1) == SQLITE_OK &&
                sqlite3_bind_int(insertStatement,2, profileID) == SQLITE_OK &&
            sqlite3_bind_text(insertStatement,3, result.latin.firstPrincipalPart, -1, nil) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement,4,result.formID ) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 5, Int32(resultNum)) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 6, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 7, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 8, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 9, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 10, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 11, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 12, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 13, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 14, 0) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 15, Int32(resultNum)) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 16, 1) == SQLITE_OK
        else {
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard sqlite3_step(insertStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("Successfully inserted \(result.latinString) into the confidence table.")
    }
    //returns all the usernames in the profiles table
    func checkConfidence(result:Question,profileID:Int32, insertSQL : String) ->Bool{
        let queryStatement = try? prepareStatement(sqlStatement: Confidence.GetRowIDQueryStatement)            // will always finalize the pointer
            defer {
                sqlite3_finalize(queryStatement)
            }
            guard
                sqlite3_bind_int(queryStatement, profileID,1) == SQLITE_OK &&
                sqlite3_bind_text(queryStatement, 2, result.latin.firstPrincipalPart, -1, nil) == SQLITE_OK &&
                sqlite3_bind_int(queryStatement, 3, profileID) == SQLITE_OK
            else{
                return false
            }
        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            return false //if an error is thrown there is no row and we have to create a new one
        }
        let row_id = try sqlite3_column_int(queryStatement, 0) == SQLITE_ROW
        return true
    }
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
    //gets the formID from the table give the appropiate forms
    func GetFromID(formList:[NSString])->Int32?{
        let querysql = Form.GetQueryStatement
        guard let queryStatement = try? prepareStatement(sqlStatement: querysql) else{
            return nil
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        //bind all of the forms into the prepared statment
        for i in 1...formList.count-1{
            guard sqlite3_bind_text(queryStatement, Int32(i),formList[i].utf8String , -1, nil) == SQLITE_OK else{
                print(errorMessage)
                return nil
                
            }
        }
        //step the statment once all forms entered
        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            return nil
        }
        //collect the results
        let result = sqlite3_column_int(queryStatement, 0)
        return result
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
        //let id = sqlite3_column_int(queryStatement, 0)
        guard let result = sqlite3_column_text(queryStatement, 1) else{
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
    func QueryProfile(columns:[String]=["*"]){
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
    //returns the user'sID number so it can be used later when storing results
    func SetCurrentUserID(username:NSString) throws -> Int32{
        let querySql = Profile.GetUserIDQueryStatement
        guard let queryStatement = try? prepareStatement(sqlStatement: querySql) else {
            throw SQLiteError.Prepare(message: errorMessage)
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        guard sqlite3_bind_text(queryStatement, 1, username.utf8String, -1, nil) == SQLITE_OK else {
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            throw SQLiteError.Step(message: errorMessage)
        }
        let id = sqlite3_column_int(queryStatement, 0)
        return id
    }
    //returns the latest error message
    func GetErrorMessage()->String{
        return errorMessage
    }
    
}
// the errors that will be throws
enum SQLiteError: Error {
    case OpenDatabase(message: String) //error opening the database
    case Prepare(message: String) //erorr preparing a sql statment
    case Step(message: String) // error inputing values into the statment
    case Bind(message: String) // error running the sql statment with inputted values
}
