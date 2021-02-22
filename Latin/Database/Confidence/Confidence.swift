//
//  Confidence.swift
//  Latin
//
//  Created by Kenan Palmer on 08/12/2020.
//

import Foundation
import SQLite3
//This class contains all of the statements and methods for dealing with the confidence table
class Confidence: SQLTable{
    
    var id: Int32
    var profile_id: Int32
    var word: NSString
    var form_id: Int32
    var attempts: [Int32]
    var totalCorrect: Int32
    var total:Int32
    
    static var insertStatement: String{
        return """
INSERT INTO Confidence (row_id, Profile_id, word, form_id, attempt1, attempt2, attempt3, attempt4, attempt5, attempt6, attempt7, attempt8, attempt9, attempt10, totalCorrect,total) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);
"""
    }
    static var createStatement: String {
    // the statement for creating a table
    //attempts can be 0 or 1,1 for correct and 0 for incorrect or no attempt the total attempts column will show if there are less than 10 attmepts, the the table will only take the first n vaues and ignore
    // the autoincrement will automatically give you the next id number 
    return """
    CREATE TABLE IF NOT EXISTS Confidence(
    row_id INTEGER PRIMARY KEY AUTOINCREMENT,
    profile_id INT NOT NULL,
    word CHAR(255) NOT NULL,
    form_id INT,
    attempt1 INT,
    attempt2 INT,
    attempt3 INT,
    attempt4 INT,
    attempt5 INT,
    attempt6 INT,
    attempt7 INT,
    attempt8 INT,
    attempt9 INT,
    attempt10 INT,
    totalCorrect INT,
    total INT);
    """
    }
    static var dropStatement: String{ // statement for deleting a table
        return """
            DROP TABLE IF EXISTS Confidence;
            """
    }
    static var GetTotalQueryStatement: String{
        return"""
            SELECT total FROM Confidence WHERE Profile_id = (?) AND word = (?) AND form_id = (?)

            """
    }
    static var GetTotalCorrectQueryStatement: String{
        return"""
            SELECT totalCorrect FROM Confidence WHERE Profile_id = (?), word = (?), form_id = (?)

            """
    }
    static var GetAttemptsQueryStatement: String{
        return """
            SELECT attempt1 , attempt2, attempt3, attempt4, attempt5, attempt6, attempt7, attempt8, attempt9, attempt10
            WHERE Profile_id = (?), form_id = (?), word = (?)
            """
    }
    static var GetRowIDQueryStatement: String{
        return"""
            SELECT row_id FROM Confidence WHERE Profile_id = (?) AND word = (?) AND form_id = (?);
"""
    }
    init(id_:Int32 ,profile_id_:Int32,word_:NSString,form_id_:Int32,attempt1_:Int32){
        self.id = id_
        self.profile_id=profile_id_
        self.word=word_
        self.form_id = form_id_
        self.attempts=[attempt1_]
        if attempt1_ == 1{
            totalCorrect = 1
        }else{
            totalCorrect = 0
        }
        self.total=1
    }
    
}

