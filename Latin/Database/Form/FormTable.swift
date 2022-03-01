//
//  FormTable.swift
//  Latin
//
//  Created by Kenan Palmer on 04/02/2021.
//This class contains all the statements and methods for communicating with the from table

import Foundation
import SQLite3

class Form: SQLTable{
    static var insertStatement: String{
        return """
INSERT INTO Form(part1,part2,part3,part4,part5,part6) VALUES(?,?,?,?,?,?);
"""
    }
    static var createStatement: String {
    // the statement for creating a table
    //attempts can be 0,1,2 0 for no attempt, 1 for incorrect, 2 for correct
    return """
    CREATE TABLE IF NOT EXISTS Form(
    form_id INTEGER PRIMARY KEY AUTOINCREMENT,
    part1 CHAR(225),
    part2 CHAR(225),
    part3 CHAR(225),
    part4 CHAR(225),
    part5 CHAR(225),
    part6 CHAR(225),
    wordType CHAR(225));
    """
    }
    static var dropStatement: String{ // statement for deleting a table
        return """
            DROP TABLE IF EXISTS Form;
            """
    }
    static var GetQueryStatement: String{
        return """
            SELECT *
            FROM Form
            WHERE part1 = (?) AND
            part2 = (?) AND
            part3 = (?) AND
            part4 = (?) AND
            part5 = (?) AND
            part6 = (?);
            """
    }
    static var GetFormFromId:String{
        return "SELECT * FROM form WHERE form_id = (?);"
    }
}
