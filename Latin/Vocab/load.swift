//
//  load.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//
import UIKit
import SwiftUI
import CoreLocation
// read the data from the file. Should be under GCSE latin.csv
func readDataFromFile(file:String)-> String!{
    guard let filepath = Bundle.main.path(forResource: file, ofType: "csv")
        else {
            print("can't find file")
           return nil
    }
    do {
       let contents = try String(contentsOfFile: filepath)
       return contents
    } catch {
        print("File Read Error for file \(filepath)")
        return nil
    }
}

//load the data in the csv file
let CSVstring: String = readDataFromFile(file: "GCSE latin")
//turn the file into a list where each element is a line in the file
let vocabData:[String] = CSVstring.components(separatedBy: "\n")
let PROGRAMDATABASE = ProgramDatabase(file: vocabData)
