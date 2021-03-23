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
/* THIS CLASS COMMUNICATES WITH THE SQLDATABASE ALL SELCTION INSERTION CREATION UPDATES AND DELETES WILL BE EXECUTED HERE. THE REST OF THE PROGRAM ACCESSES THE DATABASE THROUGH HERE THE FIRST FEW FUCNTIONS SHOW WHAT THE GENERAL STRUCTURE OF THE PROGRAM IS BUT I OMITTED THOSE COMMENTS FROM THE OTHER FUNCTIONS BECAUSE IT WAS UNEEDED IF YOU DONT UNDERSTAND WHY IVE DONE SOMETHING, YOU SHOULD BE ABLE TO UNDERSTAND ON A QUICK SQL GOOGLE SEARCH
 
 THE DIFFERENCE BETWEEN SQLITE_DONE AND SQLITE_ROW CONFUSED ME FOR A BIT. SQLITE_DONE BE GIVEN IF NO ROW IS RETURNED. SQLITE_ROW WILL BE GIVEN IF SOMETHING IS RETURNED FORM THE QUERY
 */
class SQLiteDatabase: ObservableObject {
    // the pointer to the database
    private let dbPointer: OpaquePointer?
    private let profileQueryStatementString = "SELECT * FROM Profile WHERE ;"
    // the last error message from the data base, very handy for debugging
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
    func insertForm(part1:String,part2:String,part3:String, part4:String, part5:String,type: String) throws {
        let insertStatement = try prepareStatement(sqlStatement: Form.insertStatement)
        // will always finalize the pointer
        defer {
            sqlite3_finalize(insertStatement)
        }
        let NSPart1 = part1 as NSString
        let NSPart2 = part2 as NSString
        let NSPart3 = part3 as NSString
        let NSPart4 = part4 as NSString
        let NSPart5 = part5 as NSString
        let NSPart6 = type as NSString // the word type and possible number like verb 1 or noun 5
        guard
                sqlite3_bind_text(insertStatement, 1, NSPart1.utf8String, -1, nil) == SQLITE_OK &&
                sqlite3_bind_text(insertStatement, 2, NSPart2.utf8String, -1, nil) == SQLITE_OK &&
                sqlite3_bind_text(insertStatement, 3, NSPart3.utf8String, -1, nil) == SQLITE_OK &&
                sqlite3_bind_text(insertStatement, 4, NSPart4.utf8String, -1, nil) == SQLITE_OK &&
                sqlite3_bind_text(insertStatement, 5, NSPart5.utf8String, -1, nil) == SQLITE_OK &&
                sqlite3_bind_text(insertStatement, 6, NSPart6.utf8String, -1, nil) == SQLITE_OK
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
            sqlite3_bind_null(insertStatement, 1) == SQLITE_OK  &&
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
        let resultNum: Int32
        if result.isCorrect{
            resultNum = Int32(1) //1 for correct 0 for inncorrect
        }else{
            resultNum = Int32(0)
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
            sqlite3_bind_int(insertStatement, 6, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 7, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 8, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 9, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 10, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 11, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 12, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 13, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 14, -1) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 15, resultNum) == SQLITE_OK &&
            sqlite3_bind_int(insertStatement, 16, 1) == SQLITE_OK
        else {
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard sqlite3_step(insertStatement) == SQLITE_DONE else {
            throw SQLiteError.Step(message: errorMessage)
        }
        print("Successfully inserted \(result.latin.firstPrincipalPart) into the confidence table with form_id \(result.formID) and profile ID \(profileID)")
    }
    //returns all the usernames in the profiles table
    func checkConfidence(result:Question,profileID:Int32, insertSQL : String) ->Int32{
        let queryStatement = try? prepareStatement(sqlStatement: Confidence.GetRowIDQueryStatement)
        // will always finalize the pointer
            defer {
                sqlite3_finalize(queryStatement)
            }
            guard
                sqlite3_bind_int(queryStatement, 1 ,profileID) == SQLITE_OK &&
                sqlite3_bind_text(queryStatement, 2, result.latin.firstPrincipalPart, -1, nil) == SQLITE_OK &&
                sqlite3_bind_int(queryStatement, 3, result.formID) == SQLITE_OK
            else{
                print(errorMessage)
                return 0
            }
        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            print("no row available")
            return 0 //if an error is thrown there is no row and we have to create a new one
        }
        let row_id = sqlite3_column_int(queryStatement, 0)
        print("checked \(row_id)")
        return row_id
    }
    // in this function we retieve all the data, shift the attmpts down by one and increase total number of attmepts and update total correct
    func UpdateConfidence(row_id:Int32,result:Question)throws{
        // GET THE RESULTS
        let SelectQueryStatement = try? prepareStatement(sqlStatement: Confidence.GetRow)
        defer{
            sqlite3_finalize(SelectQueryStatement)
        }
        guard
            sqlite3_bind_int(SelectQueryStatement, 1, row_id) == SQLITE_OK
        else{
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard
            sqlite3_step(SelectQueryStatement) == SQLITE_ROW
        else{
            throw SQLiteError.Step(message: errorMessage)
        }
        let result_row_ID = sqlite3_column_int(SelectQueryStatement,0)
        let result_profile_ID = sqlite3_column_int(SelectQueryStatement,1)
        let result_word = String(cString: sqlite3_column_text(SelectQueryStatement,2))
        let result_form_ID = sqlite3_column_int(SelectQueryStatement, 3)
        var result_attempt:[Int32] = [] //the first column is most recent the last is the 10th
        for i in (4...13){
            result_attempt.append(sqlite3_column_int(SelectQueryStatement, Int32(i)))
        }
        let result_correct_attempts = sqlite3_column_int(SelectQueryStatement, 14)
        let result_total_attempts = sqlite3_column_int(SelectQueryStatement, 15)

        print("BEFORE :\(result_row_ID) | \(result_profile_ID) | \(result_word) | \(result_form_ID) | \(result_attempt[0]) | \(result_attempt[1]) | \(result_attempt[2]) | \(result_attempt[3]) | \(result_attempt[4]) | \(result_attempt[5]) | \(result_attempt[6]) | \(result_attempt[7]) | \(result_attempt[8])| \(result_attempt[9])| \(result_correct_attempts) | \(result_total_attempts)")
        
        //PREPARE THE NEW ROW
        let new_total_attempts = result_total_attempts + 1
        let new_correct_attempts:Int32
        var newRow : [Int32] = result_attempt.dropLast() // remove the last attempt
        if result.isCorrect{
            newRow.insert(1, at: 0) // if correct add 1 to beginning of the list
            new_correct_attempts = result_correct_attempts + 1
        }else{
            newRow.insert(0, at: 0)
            new_correct_attempts = result_correct_attempts
        }
        //UPDATE the row
        
        
        let updateQueryStatement = try? prepareStatement(sqlStatement: Confidence.UpdateQueryStatement)
        defer{
            sqlite3_finalize(updateQueryStatement)
        }
        //UPDATE Confidence SET attempt1 = (?), attempt2 = (?), attempt3 = (?), attempt4 = (?), attempt5 = (?), attempt6 = (?), attempt7 = (?), attempt8 = (?), attempt9 = (?), attempt10 = (?), totalCorrect = (?),total = (?) WHERE row_id = (?);
        
        for i in 0...9{
                guard sqlite3_bind_int(updateQueryStatement, Int32(i+1), newRow[i]) == SQLITE_OK
                else{
                    throw SQLiteError.Bind(message: errorMessage)
                }
            }
        guard
            sqlite3_bind_int(updateQueryStatement, 11, new_total_attempts ) == SQLITE_OK &&
            sqlite3_bind_int(updateQueryStatement, 12, new_correct_attempts) == SQLITE_OK &&
            sqlite3_bind_int(updateQueryStatement, 13, row_id) == SQLITE_OK
            
        else{
            throw SQLiteError.Bind(message: errorMessage)
        }
        guard
            sqlite3_step(updateQueryStatement) == SQLITE_DONE
        else{
            throw SQLiteError.Step(message: errorMessage)
        }
        print("successfully updated \(result_word) in the confidence table")
    }
    //returns a list of stats digram with a given query statement
    //func GetStatsDiagrams(word:Word,formID:Int32,ProfileID:Int32)throws->(StatsDiagram){}

    //returns all the usernames in the database. many used for debugging
    func printUsernames(){
        let querysql = "SELECT * FROM Profiles;"
        let queryStatement = try? prepareStatement(sqlStatement: querysql)
        defer {
            sqlite3_finalize(queryStatement)
        }
        while sqlite3_step(queryStatement) == SQLITE_ROW{
            print(sqlite3_column_int(queryStatement, 0))
            print(String(cString: sqlite3_column_text(queryStatement,1)))
            print(String(cString: sqlite3_column_text(queryStatement,2)))
        }
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
        for i in 1...formList.count{
            guard sqlite3_bind_text(queryStatement, Int32(i),formList[i-1].utf8String , -1, nil) == SQLITE_OK else{
                print(errorMessage)
                return nil
                
            }
        }
        //step the statment once all forms entered
        guard sqlite3_step(queryStatement) == SQLITE_ROW
        else {
            print(errorMessage)
            return nil
        }
        //collect the results
        let result = sqlite3_column_int(queryStatement, 0)
        return result
    }
    //gets all the form ids given a query statement
    func GetStatsForms(query:String)->[Int32]{
        guard let queryStatement = try? prepareStatement(sqlStatement: query) else{
            return []
        }
        defer {
            sqlite3_finalize(queryStatement)
        }

        //step the statment once all forms entered
        var formIDs: [Int32] = []
        while sqlite3_step(queryStatement) == SQLITE_ROW{
            //append all results
            formIDs.append(sqlite3_column_int(queryStatement, 0))
        }
        //collect the results
        return formIDs
    }
    // returs a string of the different form parts given an id
    func GetForm(id:Int32) -> [String]{
        let querySql = Form.GetFormFromId
        guard let queryStatement = try? prepareStatement(sqlStatement: querySql) else {
            print(errorMessage)
            return []
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        guard sqlite3_bind_int(queryStatement, 1, id) == SQLITE_OK else {
            print(errorMessage)
            return []
        }
        guard sqlite3_step(queryStatement) == SQLITE_ROW else {
            print(errorMessage)
            return []
        }
        // ID COLUMN
        //let id = sqlite3_column_int(queryStatement, 0)
        //comine the different form parts
        var combined: [String] = []
        for i in 1...6{
            combined.append(String(cString: sqlite3_column_text(queryStatement, Int32(i))))
        }
        return combined
    }
    func GetDiagrams(words:[Word], formIDs:[Int32], profileID:Int32)->[StatsDiagram]?{
        var statsDiagrams: [StatsDiagram] = []
        for word in words{
            for formID in formIDs{
                let NSWord: NSString = word.firstPrincipalPart as NSString
                let queryStatement = try? prepareStatement(sqlStatement: Confidence.SelectAllQueryStatement)
                guard sqlite3_bind_int(queryStatement, 1, profileID) == SQLITE_OK &&
                sqlite3_bind_int(queryStatement, 2, formID)  == SQLITE_OK &&
                sqlite3_bind_text(queryStatement, 3, NSWord.utf8String, -1, nil) == SQLITE_OK
                else{
                    print(errorMessage)
                    return nil
                }
                while sqlite3_step(queryStatement) == SQLITE_ROW{
                    /*
                    let result_row_ID = sqlite3_column_int(queryStatement,0)
                    let result_profile_ID = sqlite3_column_int(queryStatement,1)
                    let result_word = String(cString: sqlite3_column_text(queryStatement,2))
                    let result_form_ID = sqlite3_column_int(queryStatement, 3)
 */
                    var result_attempt:[Int32] = [] //the first column is most recent the last is the 10th
                    for i in (4...13){
                        result_attempt.append(sqlite3_column_int(queryStatement, Int32(i)))
                    }
                    let result_correct_attempts = sqlite3_column_int(queryStatement, 14)
                    let result_total_attempts = sqlite3_column_int(queryStatement, 15)
                    let formList = GetForm(id: formID)
                    statsDiagrams.append(StatsDiagram(correct: result_correct_attempts, Total: result_total_attempts, last10: result_attempt,latin: word.GetForm(formString: formList),form: formList.joined(separator: ",")))
                    print(result_correct_attempts, result_total_attempts, result_attempt)
                }
            }
        }
        print(errorMessage)
        return statsDiagrams
    }
    //prints all the forms so you can easily which form has what ID
    func ReturnForms(){
        let querySql = "SELECT * FROM form"
        let querystatement = try? prepareStatement(sqlStatement: querySql)
        defer{
            sqlite3_finalize(querystatement)
        }
        while sqlite3_step(querystatement) == SQLITE_ROW {
        let resultID = sqlite3_column_int(querystatement,0)
        let resultpart1 = String(cString: sqlite3_column_text(querystatement,1))
        let resultpart2 = String(cString: sqlite3_column_text(querystatement,2))
        let resultpart3 = String(cString: sqlite3_column_text(querystatement,3))
        let resultpart4 = String(cString: sqlite3_column_text(querystatement,4))
        let resultpart5 = String(cString: sqlite3_column_text(querystatement,5))
        let resultpart6 = String(cString: sqlite3_column_text(querystatement,6))
        print("\(resultID) | \(resultpart1) | \(resultpart2) | \(resultpart3) | \(resultpart4) | \(resultpart5) | \(resultpart6)")
        }
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
    //returns a profile given an id
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
            print(errorMessage)
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
    //returns true if a username is taken
    func CheckUsername(Username:NSString)->Bool{
        let querySql = "SELECT id FROM Profiles WHERE Username = (?);"
        guard let queryStatement = try? prepareStatement(sqlStatement: querySql) else {
            return false
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        guard sqlite3_bind_text(queryStatement, 1, Username.utf8String, -1, nil) == SQLITE_OK else {
            return false
        }
        //YOU ARE HERE
        guard sqlite3_step(queryStatement) == SQLITE_ROW else{
            return false
        }
        return true
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
    //returns the latest error message very handy for debugging
    func GetErrorMessage()->String{
        return errorMessage
    }
    
    
    
    //Updates the users username given an id
    func UpdateUsername(profile_id:Int32, username:String)->Bool{
        let querySql = "UPDATE Profiles SET username = (?) WHERE id = (?)"
        let NSUsername = username as NSString
        guard let queryStatement = try? prepareStatement(sqlStatement: querySql) else {
            return false
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        
        guard
            sqlite3_bind_text(queryStatement, 1, NSUsername.utf8String, -1, nil) == SQLITE_OK &&
            sqlite3_bind_int(queryStatement, 2, profile_id) == SQLITE_OK else {
            return false
        }
        guard sqlite3_step(queryStatement) == SQLITE_DONE else{
            print(errorMessage)
            return false
        }
        return true
    }

//updates the password
    func UpdatePassword(profile_id:Int32, password:String)->Bool{
    let querySql = "UPDATE Profiles SET password = (?) WHERE id = (?)"
    let NSPassword = password as NSString
    guard let queryStatement = try? prepareStatement(sqlStatement: querySql) else {
        return false
    }
    defer {
        sqlite3_finalize(queryStatement)
    }
    
    guard
        sqlite3_bind_text(queryStatement, 1, NSPassword.utf8String, -1, nil) == SQLITE_OK &&
        sqlite3_bind_int(queryStatement, 2, profile_id) == SQLITE_OK else {
        return false
    }
    guard sqlite3_step(queryStatement) == SQLITE_DONE else{
        return false
    }
    return true
}
    
//reset progress by deleting all rows with the profile id given
    func ResetProgress(profile_id:Int32)->Bool{
            let querySql = Confidence.DeleteUserRowsStatement
        guard let queryStatement = try? prepareStatement(sqlStatement: querySql) else {
            return false
        }
        defer {
            sqlite3_finalize(queryStatement)
        }
        
        guard
            sqlite3_bind_int(queryStatement, 1, profile_id) == SQLITE_OK else {
            return false
        }
        guard sqlite3_step(queryStatement) == SQLITE_DONE else{
            return false
        }
        return true
    }
    func DeleteUser(profile_id:Int32)->Bool{
        if !ResetProgress(profile_id:profile_id){
            return false
        }
        //delete from profile table
        let ProfileQuerySql = Profile.DeleteUser
        guard let profileQueryStatement = try? prepareStatement(sqlStatement: ProfileQuerySql) else {
            return false
        }
        defer {
            sqlite3_finalize(profileQueryStatement)
        }
        
        guard
            sqlite3_bind_int(profileQueryStatement, 1, profile_id) == SQLITE_OK else {
            return false
        }
        guard sqlite3_step(profileQueryStatement) == SQLITE_DONE else{
            return false
        }
        return true
    }
}
// the types errors that will be throws
enum SQLiteError: Error {
    case OpenDatabase(message: String) //error opening the database
    case Prepare(message: String) //erorr preparing a sql statment
    case Step(message: String) // error inputing values into the statment
    case Bind(message: String) // error running the sql statment with inputted values
}
