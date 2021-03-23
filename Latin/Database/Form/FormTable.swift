//
//  FormTable.swift
//  Latin
//
//  Created by Kenan Palmer on 04/02/2021.
//

import Foundation
import SQLite3
//This class contains all the statements and methods for communicating with the from table
class Form: SQLTable{
    var id: Int32
    var part1: NSString
    var part2: NSString
    var part3: NSString
    var part4: NSString
    var part5: NSString
    var part6: NSString
    var wordType: WordTypes
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
    init(id_: Int32, part1_:NSString, part2_:NSString, part3_:NSString, part4_:NSString, part5_:NSString,part6_:NSString, wordType_:WordTypes){
        id = id_
        part1 = part1_
        part2 = part2_
        part3 = part3_
        part4 = part4_
        part5 = part5_
        part6 = part6_
        wordType = wordType_
    }
    class VerbRow{
        var part1: Mood
        var part2: Voice
        var part3: Tense
        var part4: PersonNum
        var part5: Gender
        var part6: VerbConjugation
        init(part1_:String,part2_:String,part3_:String,part4_:String,part5_:String,part6_:String) {
            part1 = Mood.init(rawValue: part1_)!
            part2 = Voice.init(rawValue: part2_)!
            part3 = Tense.init(rawValue: part3_)!
            part4 = PersonNum.init(rawValue: part4_)!
            part5 = Gender.init(rawValue: part5_)!
            part6 = VerbConjugation.init(rawValue: part6_)!
        }
    }
    
}
