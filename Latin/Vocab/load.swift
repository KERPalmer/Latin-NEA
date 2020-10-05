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

//this will store all the list of objects of the different wor types
class ProgramDatabase:ObservableObject{
    @Published var verbClassList:[Verb]=[]
    @Published var nounClassList:[Noun]=[]
    @Published var prepositionClassList:[Preposition]=[]
    @Published var adjectiveClassList:[Adjective]=[]
    init(file:[String]){
        var id:Int=0
        for line in file{
            print(line)
            //prepositions
            if line.contains("prepostion"){
                self.prepositionClassList.append(Preposition(string: line))
            }
            //nouns, irregular and normal
            else if line.contains(",noun"){
                if line.contains("irregular"){
                    self.nounClassList.append(IrregularNoun(fileLine_: line, id_: id))
                }else{
                    self.nounClassList.append(Noun(fileLine_: line, id_: id))
                }
            }
            //verb,deponent, irregular and normal
            else if line.contains("verb "){
                if line.lowercased().contains("irregular"){
                    self.verbClassList.append(IrregularVerb(line: line, id_: id))
                }else if line.lowercased().contains("deponent"){
                    self.verbClassList.append(DeponantVerb(line: line, id_: id))
                }else{
                    self.verbClassList.append(Verb(line: line, id_: id))
                }
                //adjectives
            }else if line.contains("adjective"){
                self.adjectiveClassList.append(Adjective(line:line,id_: id))
            }else{
                
            }
            id+=1
        }
    }
}
//load the data in the csv file
let CSVstring: String = readDataFromFile(file: "GCSE latin")
//turn the file into a list where each element is a line in the file
let vocabData:[String] = CSVstring.components(separatedBy: "\n")
let PROGRAMDATABASE = ProgramDatabase(file: vocabData)
