//
//  Confidence.swift
//  Latin
//
//  Created by Kenan Palmer on 08/12/2020.
//

import Foundation
import SQLite3
class Confidence: SQLTable{
    
    var id: Int32
    var profile_id: Int32
    var word_id: Int32
    var form: NSString
    var attempts: [Int32]
    var totalCorrect: Int32
    var total:Int32
    
    static var insertStatement: String{
        return """
INSERT INTO Confidence(id,Profile_id, word_id, form, attempt1, attempt2, attempt3, attempt4, attempt5, attempt6, attempt7, attempt8, attempt9, attempt10, totalCorrect,total) VALUES (?,?,?,?,?,0,0,0,0,0,0,0,0,0,?,?)
"""
    }
    static var createStatement: String {
    // the statement for creating a table
    //attempts can be 0,1,2 0 for no attempt, 1 for incorrect, 2 for correct
    return """
    CREATE TABLE IF NOT EXISTS Confidence(
    id INT PRIMARY KEY NOT NULL,
    profile_id INT NOT NULL,
    word_id INT NOT NULL,
    form CHAR(255),
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
            SELECT total FROM Confidence WHERE Profile_id = (?), word_id = (?), form = (?)

            """
    }
    static var GetTotalCorrectQueryStatement: String{
        return"""
            SELECT totalCorrect FROM Confidence WHERE Profile_id = (?), word_id = (?), form = (?)

            """
    }
    static var GetAttemptsQueryStatement: String{
        return """
            SELECT attempt1 , attempt2, attempt3, attempt4, attempt5, attempt6, attempt7, attempt8, attempt9, attempt10
            WHERE Profile_id = (?), form = (?)
            """
    }
    init(id_:Int32 ,profile_id_:Int32,word_id_:Int32,form_:NSString,attempt1_:Int32){
        self.id = id_
        self.profile_id=profile_id_
        self.word_id=word_id_
        self.form = form_
        self.attempts=[attempt1_]
        if attempt1_ == 1{
            totalCorrect = 2
        }else{
            totalCorrect = 1
        }
        self.total=1
    }
}

