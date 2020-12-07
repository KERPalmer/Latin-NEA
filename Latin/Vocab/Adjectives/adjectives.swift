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
        self.femStem=String(genders[0].dropLast(1))
        self.neuNom=String(genders[1])
        self.neuStem=String(genders[1].dropLast(2))
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    func get_positive(gender: String,caseForm:String,isSingle:Bool = false)->String{
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
    func get_comparative(gender:String, caseForm:String, isSingle:Bool = false)->String{
        let comparativeInfix = "ior"
        let comparativeSuffix = "ius"
        if isSingle{
            switch caseForm{
            case "Nom":
                if gender == "neu"{
                    return neuStem + comparativeSuffix
                }else{
                    return femStem + comparativeInfix
                }
            case "Acc":
                if gender == "neu"{
                    return neuStem + comparativeSuffix
                }else{
                    return femStem + comparativeInfix + "em"
                }
            case "Gen":
                return femStem + comparativeInfix+"is"
            case "Dat":
                return femStem + comparativeInfix + "i"
            case "Abl":
                return femStem + comparativeInfix + "e"
            default:
                return femStem + comparativeInfix
            }
        }else{
            switch caseForm{
            case "Nom":
                if gender == "neu"{
                    return neuStem + comparativeInfix   + "a"
                }else{
                    return femStem + comparativeInfix + "es"
                }
            case "Acc":
                if gender == "neu"{
                    return neuStem + comparativeSuffix + "a"
                }else{
                    return femStem + comparativeInfix + "es"
                }
            case "Gen":
                return femStem + comparativeInfix+"um"
            case "Dat":
                return femStem + comparativeInfix + "ibus"
            case "Abl":
                return femStem + comparativeInfix + "ibus"
            default:
                return femStem + comparativeInfix
            }
        }
    }
    func get_superlative(gender:String, caseForm:String, isSingle:Bool = false)->String{
        let superlativeInfix = "issim"
    switch gender{
    case "fem":
        switch caseForm{
        case "Nom":
            if isSingle{
                return femStem + superlativeInfix + "a"
            }
            else{
                return femStem + superlativeInfix + "ae"
            }
        case "Voc":
            if isSingle{
                return femStem + superlativeInfix + "a"
            }
            else{
                return femStem + superlativeInfix + "ae"
            }
        case "Acc":
            if isSingle{
                return femStem + superlativeInfix + "am"
            }
            else{
                return femStem + superlativeInfix + "as"
            }
        case "Gen":
            if isSingle{
                return femStem + superlativeInfix + "ae"
            }
            else{
                return femStem + superlativeInfix + "arum"
            }
        case "Dat":
            if isSingle{
                return femStem + superlativeInfix + "ae"
            }
            else{
                return femStem + superlativeInfix + "is"
            }
        case "Abl":
            if isSingle{
                return femStem + superlativeInfix + "ae"
            }
            else{
                return femStem + superlativeInfix + "is"
            }
        default:
            return femStem + superlativeInfix + "a"
        }
    case "masc":
        switch caseForm{
        case "Nom":
            if isSingle{
                return mascStem + superlativeInfix + "us"
            }
            else{
                return mascStem + superlativeInfix + "i"
            }
        case "Voc":
            if isSingle{
                return mascStem + superlativeInfix + "e"
            }
            else{
                return mascStem + superlativeInfix + "i"
            }
        case "Acc":
            if isSingle{
                return mascStem + superlativeInfix + "um"
            }
            else{
                return mascStem + superlativeInfix + "os"
            }
        case "Gen":
            if isSingle{
                return mascStem + superlativeInfix + "i"
            }
            else{
                return mascStem + superlativeInfix + "orum"
            }
        case "Dat":
            if isSingle{
                return mascStem + superlativeInfix + "o"
            }
            else{
                return mascStem + superlativeInfix + "is"
            }
        case "Abl":
            if isSingle{
                return mascStem + superlativeInfix + "o"
            }
            else{
                return mascStem + superlativeInfix + "is"
            }
    default:
        return mascStem + superlativeInfix + "us"
    }
    case "neu":
        switch caseForm{
        case "Nom":
            if isSingle{
                return neuStem + superlativeInfix + "um"
            }
            else{
                return neuStem + superlativeInfix + "a"
            }
        case "Voc":
            if isSingle{
                return neuStem + superlativeInfix + "um"
            }
            else{
                return neuStem + superlativeInfix + "a"
            }
        case "Acc":
            if isSingle{
                return neuStem + superlativeInfix + "um"
            }
            else{
                return neuStem + superlativeInfix + "um"
            }
        case "Gen":
            if isSingle{
                return neuStem + superlativeInfix + "i"
            }
            else{
                return neuStem + superlativeInfix + "orum"
            }
        case "Dat":
            if isSingle{
                return neuStem + superlativeInfix + "o"
            }
            else{
                return neuStem + superlativeInfix + "is"
            }
        case "Abl":
            if isSingle{
                return neuStem + superlativeInfix + "i"
            }
            else{
                return neuStem + superlativeInfix + "is"
            }
        default:
            return neuStem + superlativeInfix + "um"
        }
    default:
        return mascStem + superlativeInfix + "us"
    }
}
    func get_adverb()->String{
        return femStem + "e"
    }
}
//brevis ,breve,adjective 3,"short, brief" 1      (2 termination)
//tristis ,triste,adjective 3,sad                 (2 termination)
//celer ,"celeris, celere",adjective 3,"quick, fast"         (3 termination)
class ThirdAdjective:Adjective{
    public let femNom: String
    public let neuNom: String
    public let stem: String
    override init(line:String,id_:Int){
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "") // remove line break
        let commaSplit = trimmed.split(separator: ",", omittingEmptySubsequences: true)
        // 3 termination
        if commaSplit[1].contains("/"){
            femNom=format(str: String(commaSplit[1]))
            stem = String(format(str: String(commaSplit[1])).dropLast(2))
            neuNom=format(str: String(commaSplit[2]))
        }
        else{
            //2 termination
            femNom=format(str: String(commaSplit[0]))
            stem = String(format(str: String(commaSplit[1])).dropLast(2))
            neuNom=format(str: String(commaSplit[1]))
        }
        super.init(line: line, id_: id_)
    }
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    func get_positive(gender: String,caseForm:String,isSingle:Bool = false)->String{
        switch gender.lowercased(){
        case "masc":
            switch caseForm {
                case "Nom":
                    if isSingle{
                        return mascNom
                    }else{
                        return stem + "es"
                    }
                case  "Voc":
                    if isSingle{
                        return mascNom
                    }else{
                        return stem + "es"
                    }
                case "Acc":
                    if isSingle{
                        return stem + "em"
                    }else{
                        return stem + "es"
                    }
                case "Gen":
                    if isSingle{
                        return stem + "is"
                    }else{
                        return stem + "ium"
                    }
                case "Dat":
                    if isSingle{
                        return stem + "i"
                    }else{
                        return stem + "ibus"
                    }
                case "Abl":
                    if isSingle{
                        return stem + "e"
                    }else{
                        return stem + "ibus"
                    }
                default:
                    return stem + "is"
                
            }
        case "fem":
            switch caseForm {
                case "Nom":
                    if isSingle{
                        return femNom
                    }else{
                        return stem + "es"
                    }
                case  "Voc":
                    if isSingle{
                        return femNom
                    }else{
                        return stem + "es"
                    }
                case "Acc":
                    if isSingle{
                        return stem + "em"
                    }else{
                        return stem + "es"
                    }
                case "Gen":
                    if isSingle{
                        return stem + "is"
                    }else{
                        return stem + "ium"
                    }
                case "Dat":
                    if isSingle{
                        return stem + "i"
                    }else{
                        return stem + "ibus"
                    }
                case "Abl":
                    if isSingle{
                        return stem + "e"
                    }else{
                        return stem + "ibus"
                    }
                default:
                    return stem + "um"
                
            }
            
        case "neu":
            switch caseForm {
                case "Nom":
                    if isSingle{
                        return neuNom
                    }else{
                        return stem + "ia"
                    }
                case  "Voc":
                    if isSingle{
                        return neuNom
                    }else{
                        return stem + "a"
                    }
                case "Acc":
                    if isSingle{
                        return stem + "e"
                    }else{
                        return stem + "a"
                    }
                case "Gen":
                    if isSingle{
                        return stem + "is"
                    }else{
                        return stem + "orum"
                    }
                case "Dat":
                    if isSingle{
                        return stem + "o"
                    }else{
                        return stem + "is"
                    }
                case "Abl":
                    if isSingle{
                        return stem + "o"
                    }else{
                        return stem + "is"
                    }
                default:
                    return stem + "um"
                
            }
        default:
            return stem + "us"
        }
    }
    func get_comparative(gender:String, caseForm:String, isSingle:Bool = false)->String{
        let comparativeInfix = "ior"
        let comparativeSuffix = "ius"
        if isSingle{
            switch caseForm{
            case "Nom":
                if gender == "neu"{
                    return stem + comparativeSuffix
                }else{
                    return stem + comparativeInfix
                }
            case "Acc":
                if gender == "neu"{
                    return stem + comparativeSuffix
                }else{
                    return stem + comparativeInfix + "em"
                }
            case "Gen":
                return stem + comparativeInfix+"is"
            case "Dat":
                return stem + comparativeInfix + "i"
            case "Abl":
                return stem + comparativeInfix + "e"
            default:
                return stem + comparativeInfix
            }
        }else{
            switch caseForm{
            case "Nom":
                if gender == "neu"{
                    return stem + comparativeInfix   + "a"
                }else{
                    return stem + comparativeInfix + "es"
                }
            case "Acc":
                if gender == "neu"{
                    return stem + comparativeSuffix + "a"
                }else{
                    return stem + comparativeInfix + "es"
                }
            case "Gen":
                return stem + comparativeInfix+"um"
            case "Dat":
                return stem + comparativeInfix + "ibus"
            case "Abl":
                return stem + comparativeInfix + "ibus"
            default:
                return stem + comparativeInfix
            }
        }
    }
    func get_superlative(gender:String, caseForm:String, isSingle:Bool = false)->String{
        let superlativeInfix = "issim"
    switch gender{
    case "fem":
        switch caseForm{
        case "Nom":
            if isSingle{
                return stem + superlativeInfix + "a"
            }
            else{
                return stem + superlativeInfix + "ae"
            }
        case "Voc":
            if isSingle{
                return stem + superlativeInfix + "a"
            }
            else{
                return stem + superlativeInfix + "ae"
            }
        case "Acc":
            if isSingle{
                return stem + superlativeInfix + "am"
            }
            else{
                return stem + superlativeInfix + "as"
            }
        case "Gen":
            if isSingle{
                return stem + superlativeInfix + "ae"
            }
            else{
                return stem + superlativeInfix + "arum"
            }
        case "Dat":
            if isSingle{
                return stem + superlativeInfix + "ae"
            }
            else{
                return stem + superlativeInfix + "is"
            }
        case "Abl":
            if isSingle{
                return stem + superlativeInfix + "ae"
            }
            else{
                return stem + superlativeInfix + "is"
            }
        default:
            return stem + superlativeInfix + "a"
        }
    case "masc":
        switch caseForm{
        case "Nom":
            if isSingle{
                return stem + superlativeInfix + "us"
            }
            else{
                return stem + superlativeInfix + "i"
            }
        case "Voc":
            if isSingle{
                return stem + superlativeInfix + "e"
            }
            else{
                return stem + superlativeInfix + "i"
            }
        case "Acc":
            if isSingle{
                return stem + superlativeInfix + "um"
            }
            else{
                return stem + superlativeInfix + "os"
            }
        case "Gen":
            if isSingle{
                return stem + superlativeInfix + "i"
            }
            else{
                return stem + superlativeInfix + "orum"
            }
        case "Dat":
            if isSingle{
                return stem + superlativeInfix + "o"
            }
            else{
                return stem + superlativeInfix + "is"
            }
        case "Abl":
            if isSingle{
                return stem + superlativeInfix + "o"
            }
            else{
                return stem + superlativeInfix + "is"
            }
    default:
        return stem + superlativeInfix + "us"
    }
    case "neu":
        switch caseForm{
        case "Nom":
            if isSingle{
                return stem + superlativeInfix + "um"
            }
            else{
                return stem + superlativeInfix + "a"
            }
        case "Voc":
            if isSingle{
                return stem + superlativeInfix + "um"
            }
            else{
                return stem + superlativeInfix + "a"
            }
        case "Acc":
            if isSingle{
                return stem + superlativeInfix + "um"
            }
            else{
                return stem + superlativeInfix + "um"
            }
        case "Gen":
            if isSingle{
                return stem + superlativeInfix + "i"
            }
            else{
                return stem + superlativeInfix + "orum"
            }
        case "Dat":
            if isSingle{
                return stem + superlativeInfix + "o"
            }
            else{
                return stem + superlativeInfix + "is"
            }
        case "Abl":
            if isSingle{
                return stem + superlativeInfix + "i"
            }
            else{
                return stem + superlativeInfix + "is"
            }
        default:
            return stem + superlativeInfix + "um"
        }
    default:
        return stem + superlativeInfix + "us"
    }
}
    func get_adverb()->String{
        return stem+"ter"
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
