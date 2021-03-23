//
//  Profile.swift
//  Latin
//
//  Created by Kenan Palmer on 22/11/2020.
//
import Foundation
import SQLite3

// This class contains the statements and methods for dealing with a profile SQL Table 
class Profile: SQLTable {
    
    var id: Int32
    var Username: NSString
    var Password:NSString // i am aware the password is not at all secure, but since this is on a 'secure' phone it should be okay, i expect the users to know each other
    static var createStatement: String { // the statement for creating a table
      return """
    CREATE TABLE IF NOT EXISTS Profiles(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Username CHAR(255),
    Password CHAR(255));
    """
    }
    static var insertStatement: String{ // statment for inserting a profile
        return """
            INSERT INTO Profiles(id, Username, Password) VALUES (?,?,?);
            """
    }
    static var dropStatement: String{ // statement for deleting a table
        return """
            DROP TABLE IF EXISTS Profiles;
            """
    }
    static var GetUsernamesQueryStatement: String{
        return"""
            SELECT Username FROM Profiles;
            """
    }
    static var PasswordqueryStatement: String{
        return """
            SELECT Password FROM Profiles;
            """
    }
    static var CheckPasswordQueryStatement: String{
        return"""
            SELECT id, Password FROM Profiles WHERE Username = (?);
            """
    }
    static var GetUserIDQueryStatement:String{
        return"""
        SELECT id FROM Profiles WHERE Username = (?);
        """
    }
    static var DeleteUser:String{
        return """
            Delete From Profiles WHERE id = (?)
            """
    }
    init(id: Int32, Username: NSString, Password: NSString){
        self.id = id
        self.Username = Username
        self.Password=Password
    }
}
