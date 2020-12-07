//
//  LatinApp.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI
import SQLite3
// this will be where the data base and other important data will be stored to be used through out the program
//this will store all the list of objects of the different word types
class ProgramDatabase:ObservableObject{
    @Published var verbClassList:[Verb]=[]
    @Published var nounClassList:[Noun]=[]
    @Published var prepositionClassList:[Preposition]=[]
    @Published var adjectiveClassList:[Adjective]=[]
    @Published var conjunctionClassList:[Conjunction]=[]
    @Published var adverbClassList:[Adverb]=[]
    init(file:[String]){
        var id:Int=0
        for line in file{
            //prepositions
            if line.contains("preposition"){
                self.prepositionClassList.append(Preposition(line:line,id_:id))
            }
            //nouns, irregular and normal
            else if line.contains(",noun"){
                if line.contains("irregular"){
                    self.nounClassList.append(IrregularNoun(line: line, id_: id))
                }else{
                    self.nounClassList.append(Noun(line: line, id_: id))
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
                if line.contains("indeclinable"){
                    self.adjectiveClassList.append(IndeclinableAdjective(line: line, id_: id))
                }
                else if line.contains("1/2"){
                    self.adjectiveClassList.append(FirstSecondAdjective(line:line,id_: id))
                }
                else if line.contains("3"){
                    self.adjectiveClassList.append(ThirdAdjective(line:line,id_: id))
                }
            }else if line.contains("conjunction"){
                self.conjunctionClassList.append(Conjunction(line: line, id_:id))
            }else if line.contains("adverb"){
                self.adverbClassList.append(Adverb(line: line, id_: id))
            }
            id+=1
        }
    }
    func printVerbs(){
        for verb in self.verbClassList{
            print(verb.present1S)
        }
    }
    func GetVerbs()->[Verb]{
        var verbs:[Verb]=[]
        for verb in verbClassList{
            print(verb.present1S)
            verbs.append(verb)
        }
        return verbs
    }
}
class Data: ObservableObject{
    @Published var db:SQLiteDatabase? = ConnectDB()
    @Published var programData:ProgramDatabase = ProgramDatabase(file: vocabData)
    @Published var debug:Bool = true
    @Published var isLoggedIn = false
    init(){
        if debug == true{
            resetTestDatabase(db: db)
        }
    }
}
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


@main
struct LatinApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Data())
        }
    }
}

struct LatinApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
