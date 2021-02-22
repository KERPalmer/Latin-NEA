//
//  connectDB.swift
//  Latin
//
//  Created by Kenan Palmer on 22/11/2020.
//

import Foundation
import SQLite3
// open database and returns an object that you can use to acces the databse
func ConnectDB()->SQLiteDatabase?{
    // the program database
    let db: SQLiteDatabase
    // the URL of the file of the databse
    let fileURL = try! FileManager.default
        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        .appendingPathComponent("Latin.sqlite")
    do {
        //attempt to open database at file location
        db = try SQLiteDatabase.open(path: fileURL.path)
        print("Successfully opened connection to database.")
        return db
    } catch {
        // if no database is found there is a serious program error
        print("Unable to open database.")
        return nil
    }
}
