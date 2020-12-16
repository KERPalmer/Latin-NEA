//
//  resetTestDatabase.swift
//  Profile sql
//
//  Created by Kenan Palmer on 09/11/2020.
//

import Foundation
import SQLite3
func resetTestDatabase(db:SQLiteDatabase?){
    do {
        try db?.dropTable(table: Profile.self)
        try db?.dropTable(table: Confidence.self)
    } catch {
        
        print(db!.GetErrorMessage())
    }
    
    do {
        try db!.createTable(table: Profile.self)
        try db!.createTable(table: Confidence.self)
    } catch {
        print(db!.GetErrorMessage())
    }
    // inserting 2 test profiles
    do {
        try db?.insertProfile(profile: Profile(id: 0, Username: "TEST", Password: "1234"), insertSQL: Profile.insertStatement)
        try db?.insertProfile(profile: Profile(id: 1, Username: "Julius Caesar", Password: "Cutbacks"), insertSQL: Profile.insertStatement)
        try db?.insertConfidence(confidence: Confidence(id_: 0, profile_id_: 0, word_id_: 0, form_: "present1S", attempt1_: 1), insertSQL: Confidence.insertStatement)
    } catch {
        print("Fail to insert")
        print(db!.GetErrorMessage())
    }
    let testProfile = db?.GetProfile(id:0)
    print(testProfile!.Username as Any)
}
