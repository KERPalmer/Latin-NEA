//
//  Vocab.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 06/07/2020.
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

//remove unwanted commas and whitespaces
func format(str:String)->String{
    var trim = str
    trim=trim.replacingOccurrences(of: ",", with: "")
    trim=trim.trimmingCharacters(in: .whitespacesAndNewlines)
    return trim
}

// puts each line of the vocab file in the a list of objects of each
func generateTerms(file:[String],term:String){
    var id:Int=0
    for line in file{
        //prepositions
        if line.contains("prepostion"){
            PROGRAMDATABASE.prepositionClassList.append(Preposition(string: line))
        }
        //nouns, irregular and normal
        else if line.contains(",noun"){
            if line.contains("irregular"){
                PROGRAMDATABASE.nounClassList.append(IrregularNoun(fileLine_: line, id_: id))
            }else{
                PROGRAMDATABASE.nounClassList.append(Noun(fileLine_: line, id_: id))
            }
        }
        //verb,deponent, irregular and normal
        else if line.contains("verb "){
            if line.lowercased().contains("irregular"){
                PROGRAMDATABASE.verbClassList.append(IrregularVerb(line: line, id_: id))
            }else if line.lowercased().contains("deponent"){
                PROGRAMDATABASE.verbClassList.append(DeponantVerb(line: line, id_: id))
            }
            else{
                PROGRAMDATABASE.verbClassList.append(Verb(line: line, id_: id))
            }
        }else if line.contains("adjective"){
            PROGRAMDATABASE.adjectiveClassList.append(Adjective(line:line,id_: id))
        }else{
            
        }
        id+=1
    }
}
//this will store all the list of objects of the different wor types
class ProgramDatabase:ObservableObject{
    @Published var verbClassList:[Verb]=[]
    @Published var nounClassList:[Noun]=[]
    @Published var prepositionClassList:[Preposition]=[]
    @Published var adjectiveClassList:[Adjective]=[]
}
let PROGRAMDATABASE = ProgramDatabase()


//load the data in the csv file
let CSVstring: String = readDataFromFile(file: "GCSE latin")
//turn the file into a list where each element is a line in the file
let vocabData:[String] = CSVstring.components(separatedBy: "\n")
