//
//  nouns.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 12/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
/*
 a thing place or object that has
 case:
    nominative- subject
    vocative- direct address
    accuasative - object
    genative- possesive
    dative - to/for
    ablative - by/ with / from
person:
    singualr and plural
 gender:
    male
    singualr
    neuter
 declension:
    1,2,3,4,5
 */
class Noun :Word{
    let nominativeS:String
    let genativeS:String
    let gender:String
    let declension:String
    override init(line:String,id_:Int) {
        // form 1 :nominative singular,"genative singular, gender", declension,"translation 1,translation 2..."
        // form 2 :nominative singular,"genative singular, gender", declennsion,translation 1
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "")
        let seperated=(trimmed.split(separator: "\"", omittingEmptySubsequences: true)).map { String($0) }
        if seperated.count==4{
            //form 1
            nominativeS=format(str: seperated[0])
            let genativeAndGender:[String]=seperated[1].split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            genativeS = format(str:genativeAndGender[0])
            gender=format(str: genativeAndGender[1])
            declension=format(str: seperated[2])
        }
        else{
            //form 2
            nominativeS=format(str: seperated[0])
            let genativeAndGender:[String]=seperated[1].split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            genativeS = format(str: genativeAndGender[0])
            gender=format(str: genativeAndGender[1])
            let declensionAndTranslation = seperated[2].split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            declension=format(str: declensionAndTranslation[0])
        }
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    func GetDeclension(choice:String)->String{
        //need to get declension then gender, then
        switch self.declension{
        case "noun 1":
            let stem = String(genativeS.dropLast(2))
            //no switch for gender needed, they are all  female except 1and i still follows the declension
            switch choice.lowercased(){
            case "nom_s":
                return nominativeS
            case "voc_s":
                return stem + "a"
            case "acc_s":
                return stem + "am"
            case "gen_s":
                return genativeS
            case "dat_s":
                return stem + "ae"
            case "abl_s":
                return stem + "a"
            case "nom_p":
                return stem + "ae"
            case "voc_p":
                return stem + "ae"
            case "acc_p":
                return stem + "as"
            case "gen_p":
                return stem + "arum"
            case "dat_p":
                return stem + "is"
            case "abl_p":
                return stem + "is"
            default:
                return "cant find case/number"
            }
        case "noun 2":
            //no need for female
            switch gender{
            case"m":
                let stem = String(genativeS.dropLast(1))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return stem+"i"
                case "acc_s":
                    return stem + "um"
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "o"
                case "abl_s":
                    return stem + "o"
                case "nom_p":
                    return stem + "i"
                case "voc_p":
                    return stem + "i"
                case "acc_p":
                    return stem + "os"
                case "gen_p":
                    return stem + "orum"
                case "dat_p":
                    return stem + "is"
                case "abl_p":
                    return stem + "is"
                default:
                    return "cant find case/number"
                }
            // for castra
            case"n plural":
                let stem = String(genativeS.dropLast(2))
                    switch choice.lowercased(){
                    case "nom_s":
                        return "none"
                    case "voc_s":
                        return "none"
                    case "acc_s":
                        return "none"
                    case "gen_s":
                        return "none"
                    case "dat_s":
                        return "none"
                    case "abl_s":
                        return "none"
                    case "nom_p":
                        return nominativeS
                    case "voc_p":
                        return stem + "a"
                    case "acc_p":
                        return stem + "a"
                    case "gen_p":
                        return stem + "arum"
                    case "dat_p":
                        return stem + "is"
                    case "abl_p":
                        return stem + "is"
                    default:
                        return "cant find case/number"
                    }
            case"n":
                let stem = String(genativeS.dropLast(2))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return stem + "um"
                case "acc_s":
                    return stem + "um"
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "o"
                case "abl_s":
                    return stem + "o"
                case "nom_p":
                    return stem + "a"
                case "voc_p":
                    return stem + "a"
                case "acc_p":
                    return stem + "a"
                case "gen_p":
                    return stem + "arum"
                case "dat_p":
                    return stem + "is"
                case "abl_p":
                    return stem + "is"
                default:
                    return "cant find case/number"
                }
            default:
                return "error invalid gender"
            }
        case "noun 3":
            switch gender{
            case "f":
                let stem = String(genativeS.dropLast(2))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return nominativeS
                case "acc_s":
                    return stem + "em"
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "i"
                case "abl_s":
                    return stem + "e"
                case "nom_p":
                    return stem + "es"
                case "voc_p":
                    return stem + "es"
                case "acc_p":
                    return stem + "es"
                case "gen_p":
                    return stem + "um"
                case "dat_p":
                    return stem + "ibus"
                case "abl_p":
                    return stem + "ibus"
                default:
                    return "cant find case/number"
                }
            case"m":
                let stem = String(genativeS.dropLast(2))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return nominativeS
                case "acc_s":
                    return stem + "em"
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "i"
                case "abl_s":
                    return stem + "e"
                case "nom_p":
                    return stem + "es"
                case "voc_p":
                    return stem + "es"
                case "acc_p":
                    return stem + "es"
                case "gen_p":
                    return stem + "um"
                case "dat_p":
                    return stem + "ibus"
                case "abl_p":
                    return stem + "ibus"
                default:
                    return "cant find case/number"
                }
            case"n":
                let stem = String(genativeS.dropLast(2))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return nominativeS
                case "acc_s":
                    return nominativeS
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "i"
                case "abl_s":
                    return stem + "i"
                case "nom_p":
                    return stem + "a"
                case "voc_p":
                    return stem + "a"
                case "acc_p":
                    return stem + "a"
                case "gen_p":
                    return stem + "ium"
                case "dat_p":
                    return stem + "ibus"
                case "abl_p":
                    return stem + "ibus"
                default:
                    return "cant find case/number"
                }
            default:
                return "error invalid gender"
            }
        case "noun 4":
            switch gender{
            case"m":
                let stem = String(genativeS.dropLast(2))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return nominativeS
                case "acc_s":
                    return stem + "um"
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "ui"
                case "abl_s":
                    return stem + "u"
                case "nom_p":
                    return stem + "us"
                case "voc_p":
                    return stem + "us"
                case "acc_p":
                    return stem + "us"
                case "gen_p":
                    return stem + "uum"
                case "dat_p":
                    return stem + "ibus"
                case "abl_p":
                    return stem + "ibus"
                default:
                    return "cant find case/number"
                }
            case"f":
                let stem = String(genativeS.dropLast(2))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return nominativeS
                case "acc_s":
                    return stem + "um"
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "ui"
                case "abl_s":
                    return stem + "u"
                case "nom_p":
                    return stem + "us"
                case "voc_p":
                    return stem + "us"
                case "acc_p":
                    return stem + "us"
                case "gen_p":
                    return stem + "uum"
                case "dat_p":
                    return stem + "ibus"
                case "abl_p":
                    return stem + "ibus"
                default:
                    return "cant find case/number"
                }
            //no 4th neuter nouns in ocr
            //leaving domum as 4th masc despite in writings it can have different endings
            case"n":
                return "not yet implimented"
            default:
                return "error invalid gender"
            }
        case "noun 5":
            //no need for gender
            let stem = String(genativeS.dropLast(2))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return nominativeS
                case "acc_s":
                    return stem + "em"
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "ei"
                case "abl_s":
                    return stem + "e"
                case "nom_p":
                    return stem + "es"
                case "voc_p":
                    return stem + "es"
                case "acc_p":
                    return stem + "es"
                case "gen_p":
                    return stem + "erum"
                case "dat_p":
                    return stem + "ebus"
                case "abl_p":
                    return stem + "ebus"
                default:
                    return "cant find case/number"
                }
            case"f":
                let stem = String(genativeS.dropLast(2))
                switch choice.lowercased(){
                case "nom_s":
                    return nominativeS
                case "voc_s":
                    return nominativeS
                case "acc_s":
                    return stem + "um"
                case "gen_s":
                    return genativeS
                case "dat_s":
                    return stem + "ui"
                case "abl_s":
                    return stem + "u"
                case "nom_p":
                    return stem + "us"
                case "voc_p":
                    return stem + "us"
                case "acc_p":
                    return stem + "us"
                case "gen_p":
                    return stem + "uum"
                case "dat_p":
                    return stem + "ibus"
                case "abl_p":
                    return stem + "ibus"
                default:
                    return "cant find case/number"
                }
        default:
            return "cant find declension"
        }
    }
}

