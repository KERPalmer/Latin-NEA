//
//  resetTestDatabase.swift
//  Profile sql
//
//  Created by Kenan Palmer on 09/11/2020.
//

import Foundation
import SQLite3
//THIS FUNCTION RESETS THE 3 TABLES USED. THIS SHOULD BE DONE ONCE, WHEN THE PROGRAM START AND IS ONLY RESET ON COMMAND OR WHEN TESTING
func resetTestDatabase(db:SQLiteDatabase?){
    do {
        try db?.dropTable(table: Profile.self)
        try db?.dropTable(table: Confidence.self)
        try db?.dropTable(table: Form.self)
    } catch {
        
        print(db!.GetErrorMessage())
    }
    
    do {
        try db!.createTable(table: Profile.self)
        try db!.createTable(table: Confidence.self)
        try db!.createTable(table: Form.self)
    } catch {
        print(db!.GetErrorMessage())
    }
    // inserting 2 test profiles
    do {
        try db?.insertProfile(profile: Profile(id: 0, Username: "TEST", Password: "1234"), insertSQL: Profile.insertStatement)
        try db?.insertProfile(profile: Profile(id: 1, Username: "Julius Caesar", Password: "Cutbacks"), insertSQL: Profile.insertStatement)
    } catch {
        print("Fail to insert profile")
        print(db!.GetErrorMessage())
    }
    db?.printUsernames()
    //inserting forms into the form table
    IterateVerbForm(db:db!)
    IterateNounForm(db:db!)
    IterateAdjectiveForm(db:db!)
    //prepositions
    do {
        try db?.insertForm(part1: prepositionFollowedBy.abl.rawValue, part2: "", part3: "", part4: "", part5: "", type: WordTypes.Preposition.rawValue)
        try db?.insertForm(part1: prepositionFollowedBy.acc.rawValue, part2: "", part3: "", part4: "", part5: "", type: WordTypes.Preposition.rawValue)
    }catch{
        print("failed to insert prepositions")
    }
    //indeclinable-adverbs conjunctions and participals
    do{
        try db?.insertForm(part1: "indeclinable", part2: "", part3: "", part4: "", part5: "",type: WordTypes.Adverb.rawValue)
        try db?.insertForm(part1: "indeclinable", part2: "", part3: "", part4: "", part5: "",type: WordTypes.Conjunction.rawValue)
    }catch{
        print("failed to insert indeclinables")
    }
    print("Successfully inserted rows into the Form table.")
    let testProfile = db?.GetProfile(id:1)
    print(testProfile!.Username as Any)
    print("form test")
    db?.ReturnForms()
    print("end of test")
}
//will insert each permutation of the verb froms
// passive perfect and pluperfect require genders
// each verb has a conjunction a mood, a voice, tense, person and number and sometimes gender
func IterateVerbForm(db:SQLiteDatabase){
    for conjnction in VerbConjugation.allCases{
        for mood in Mood.allCases{
            for voice in Voice.allCases{
                for tense in Tense.allCases{
                    for personNum in PersonNum.allCases{
                        do{
                            if voice == Voice.passive && (tense == Tense.pluperfect || tense == Tense.perfect){
                                for gender in Gender.allCases{
                                    try db.insertForm(part1: mood.rawValue, part2: voice.rawValue, part3: tense.rawValue, part4:personNum.rawValue , part5: gender.rawValue,type: conjnction.rawValue)
                                }
                            }
                            else if tense == Tense.infinitive{
                                try db.insertForm(part1: mood.rawValue, part2: voice.rawValue, part3: tense.rawValue, part4:"", part5: "",type:conjnction.rawValue)
                                
                            }
                            else {
                                try db.insertForm(part1: mood.rawValue, part2: voice.rawValue, part3: tense.rawValue, part4:personNum.rawValue , part5: "",type:conjnction.rawValue)
                            }
                        }catch{
                            print("failed to insert verb line")
                        }
                    }
                }
            }
        }
    }
}
//will insert each permutation of nouns there are
//each noun has a declension, case and number
func IterateNounForm(db:SQLiteDatabase){
    for nounDeclension in NounDeclension.allCases{
        for caseNum in caseNum.allCases{
            do{
                try db.insertForm(part1:caseNum.rawValue, part2: "", part3: "", part4: "", part5: "",type: nounDeclension.rawValue)
            }catch {
                print("failed to insert noun line")
            }
        }
    }
}
//will inset each permutation of adjectives into the form table
//each adjective form has a degree, declension, a case, a number, and a gender. I am including the adverb type as a declension
func IterateAdjectiveForm(db:SQLiteDatabase){
    for degree in AdjectiveDegree.allCases{
        if (degree != AdjectiveDegree.indeclinable){
            for adjectiveDeclension in AdjectiveDeclension.allCases{
                if adjectiveDeclension != .indeclinable{
                    for caseNum in caseNum.allCases{
                        for gender in Gender.allCases{
                            do{
                                try db.insertForm(part1: degree.rawValue ,part2: caseNum.rawValue, part3: gender.rawValue,part4:"", part5: "",type: adjectiveDeclension.rawValue)
                            }catch {
                                print("failed to insert adjective line")
                            }
                        }
                    }
                }
            }
        }else{
            do{
                try db.insertForm(part1: degree.rawValue ,part2: "", part3: "",part4:"", part5: "",type: AdjectiveDeclension.indeclinable.rawValue)
            }catch {
                print("failed to insert adjective line")
            }
        }
    }
}
