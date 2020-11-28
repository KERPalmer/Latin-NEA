//
//  adjectives.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 15/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
class Adjective:Word, Codable{
    public var mascNom:String
    override init(line: String, id_: Int){
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "") // remove line break
        let commaSplit=(trimmed.split(separator: ",", omittingEmptySubsequences: true)).map { String($0) }
        self.mascNom=String(format(str: commaSplit[0]))
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
//altus ,"alta, altum",adjective 1/2,"high, deep"
class FirstSecondAdjective:Adjective{
    public let femNom:String
    public let neuNom:String
    private let mascStem:String
    private let femStem:String
    private let neuStem:String
    
    override init(line:String,id_:Int){
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "") // remove line break
        let speechSplit=(trimmed.split(separator: "\"", omittingEmptySubsequences: true)).map { String($0) }// seperate parts
        // set the genders
        var genders:[String]
        genders=speechSplit[1].split(separator: ",",omittingEmptySubsequences: true).map{ String($0)}
        self.mascStem=String(String(format(str: speechSplit[0])).dropLast(2))
        self.femNom=String(genders[0])
        self.femStem=String(genders[0])
        self.neuNom=String(genders[1])
        self.neuStem=String(genders[1].dropLast(2))
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    func getform(gender: String,caseForm:String,isSingle:Bool = false)->String{
        switch gender.lowercased(){
        case "masc":
            switch caseForm {
                case "Nom":
                    if isSingle{
                        return mascStem + "us"
                    }else{
                        return mascStem + "i"
                    }
                case  "Voc":
                    if isSingle{
                        return mascStem + "e"
                    }else{
                        return mascStem + "i"
                    }
                case "Acc":
                    if isSingle{
                        return mascStem + "um"
                    }else{
                        return mascStem + "os"
                    }
                case "Gen":
                    if isSingle{
                        return mascStem + "i"
                    }else{
                        return mascStem + "orum"
                    }
                case "Dat":
                    if isSingle{
                        return mascStem + "o"
                    }else{
                        return mascStem + "is"
                    }
                case "Abl":
                    if isSingle{
                        return mascStem + "o"
                    }else{
                        return mascStem + "is"
                    }
                default:
                    return mascStem + "um"
                
            }
        case "fem":
            switch caseForm {
                case "Nom":
                    if isSingle{
                        return femStem + "a"
                    }else{
                        return femStem + "ae"
                    }
                case  "Voc":
                    if isSingle{
                        return femStem + "a"
                    }else{
                        return mascStem + "as"
                    }
                case "Acc":
                    if isSingle{
                        return femStem + "am"
                    }else{
                        return femStem + "as"
                    }
                case "Gen":
                    if isSingle{
                        return femStem + "ae"
                    }else{
                        return femStem + "arum"
                    }
                case "Dat":
                    if isSingle{
                        return femStem + "ae"
                    }else{
                        return femStem + "is"
                    }
                case "Abl":
                    if isSingle{
                        return femStem + "a"
                    }else{
                        return femStem + "is"
                    }
                default:
                    return femStem + "um"
                
            }
            
        case "neu":
            switch caseForm {
                case "Nom":
                    if isSingle{
                        return neuStem + "um"
                    }else{
                        return neuStem + "a"
                    }
                case  "Voc":
                    if isSingle{
                        return neuStem + "um"
                    }else{
                        return neuStem + "a"
                    }
                case "Acc":
                    if isSingle{
                        return neuStem + "um"
                    }else{
                        return neuStem + "a"
                    }
                case "Gen":
                    if isSingle{
                        return neuStem + "i"
                    }else{
                        return neuStem + "orum"
                    }
                case "Dat":
                    if isSingle{
                        return neuStem + "o"
                    }else{
                        return neuStem + "is"
                    }
                case "Abl":
                    if isSingle{
                        return neuStem + "o"
                    }else{
                        return neuStem + "is"
                    }
                default:
                    return neuStem + "um"
                
            }
        default:
            return mascStem + "us"
        }
    }
}
//brevis ,breve,adjective 3,"short, brief"
//tristis ,triste,adjective 3,sad
class ThirdAdjective:Adjective{
    public let mascGen:String
    override init(line:String,id_:Int){
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "") // remove line break
        let commaSplit = trimmed.split(separator: ",", omittingEmptySubsequences: true)
        self.mascGen = format(str: String(commaSplit[1]))
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
//quot? ,indeclinable,adjective,how many?
class IndeclinableAdjective :Adjective{
    //mascNom is not the correct name but it is needed to be the same as the others
    override init(line:String,id_:Int) {
        super.init(line:line,id_:id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
