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
    } catch {
        
        print(db!.GetErrorMessage())
    }
    
    do {
        try db!.createTable(table: Profile.self)
    } catch {
        
        print(db!.GetErrorMessage())
    }
    // inserting 2 test profiles
    do {
        try db?.insertProfile(profile: Profile(id: 0, Username: "TEST", Password: "1234"), insertSQL: Profile.insertStatement)
        try db?.insertProfile(profile: Profile(id: 1, Username: "Julius Caeser", Password: "cutbacks"), insertSQL: Profile.insertStatement)
    } catch {
        print("Fail to insert")
        print(db!.GetErrorMessage())
    }
    let testProfile = db?.GetProfile(id:0)
    print(testProfile!.Username as Any)
}
