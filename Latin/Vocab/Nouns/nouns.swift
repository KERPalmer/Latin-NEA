//
//  nouns.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 12/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
/*
 THIS CLASS WILL DEAL WITH THE 5 MAIN NOUN DECLENSIONS AND HOLD ALL THE METHODS TO GET THE DIFFERENT FORMS
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
class Noun :Word,Codable{
    let nominativeS:String
    let genativeS:String
    let gender:Gender
    let declension: NounDeclension
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
            gender=Gender(rawValue: Gender.RawValue(format(str: genativeAndGender[1]))) ?? Gender.male
            declension=NounDeclension(rawValue: NounDeclension.RawValue(format(str: seperated[2]))) ?? NounDeclension.First
        }
        else{
            //form 2
            nominativeS=format(str: seperated[0])
            let genativeAndGender:[String]=seperated[1].split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            genativeS = format(str: genativeAndGender[0])
            gender=Gender(rawValue: Gender.RawValue(format(str: genativeAndGender[1]))) ?? Gender.male
            let declensionAndTranslation = seperated[2].split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            declension=NounDeclension(rawValue: NounDeclension.RawValue(format(str: declensionAndTranslation[0])))!
        }
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    override func GetForm(formString formList: [String]) -> String {
        return GetDeclension(choice: caseNum(rawValue: formList[0]) ?? caseNum.NomSingular)
    }
    func GetDeclension(choice:caseNum)->String{
        //need to get declension then gender, then
        switch self.declension{
        case NounDeclension.First:
            let stem = String(genativeS.dropLast(2))
            //no switch for gender needed, they are all  female except 1and i still follows the declension
            switch choice{
            case .NomSingular:
                return nominativeS
            case .VocSingular:
                return stem + "a"
            case .AccSingular:
                return stem + "am"
            case .GenSingular:
                return genativeS
            case .DatSingular:
                return stem + "ae"
            case .AblSingular:
                return stem + "a"
            case .NomPlural:
                return stem + "ae"
            case .VocPlural:
                return stem + "ae"
            case .AccPlural:
                return stem + "as"
            case .GenPlural:
                return stem + "arum"
            case .DatPlural:
                return stem + "is"
            case .AblPlural:
                return stem + "is"
            }
        case NounDeclension.Second:
            //no need for female
            switch gender{
            case Gender.male:
                let stem = String(genativeS.dropLast(1))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return stem+"i"
                case .AccSingular:
                    return stem + "um"
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "o"
                case .AblSingular:
                    return stem + "o"
                case .NomPlural:
                    return stem + "i"
                case .VocPlural:
                    return stem + "i"
                case .AccPlural:
                    return stem + "os"
                case .GenPlural:
                    return stem + "orum"
                case .DatPlural:
                    return stem + "is"
                case .AblPlural:
                    return stem + "is"
                }
            case .neuter:
                let stem = String(genativeS.dropLast(2))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return stem + "um"
                case .AccSingular:
                    return stem + "um"
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "o"
                case .AblSingular:
                    return stem + "o"
                case .NomPlural:
                    return stem + "a"
                case .VocPlural:
                    return stem + "a"
                case .AccPlural:
                    return stem + "a"
                case .GenPlural:
                    return stem + "arum"
                case .DatPlural:
                    return stem + "is"
                case .AblPlural:
                    return stem + "is"
                }
            default:
                return "error invalid gender"
            }
        case NounDeclension.Third:
            switch gender{
            case .female:
                let stem = String(genativeS.dropLast(2))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return nominativeS
                case .AccSingular:
                    return stem + "em"
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "i"
                case .AblSingular:
                    return stem + "e"
                case .NomPlural:
                    return stem + "es"
                case .VocPlural:
                    return stem + "es"
                case .AccPlural:
                    return stem + "es"
                case .GenPlural:
                    return stem + "um"
                case .DatPlural:
                    return stem + "ibus"
                case .AblPlural:
                    return stem + "ibus"
                }
            case .male:
                let stem = String(genativeS.dropLast(2))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return nominativeS
                case .AccSingular:
                    return stem + "em"
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "i"
                case .AblSingular:
                    return stem + "e"
                case .NomPlural:
                    return stem + "es"
                case .VocPlural:
                    return stem + "es"
                case .AccPlural:
                    return stem + "es"
                case .GenPlural:
                    return stem + "um"
                case .DatPlural:
                    return stem + "ibus"
                case .AblPlural:
                    return stem + "ibus"
                }
            case .neuter:
                let stem = String(genativeS.dropLast(2))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return nominativeS
                case .AccSingular:
                    return nominativeS
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "i"
                case .AblSingular:
                    return stem + "i"
                case .NomPlural:
                    return stem + "a"
                case .VocPlural:
                    return stem + "a"
                case .AccPlural:
                    return stem + "a"
                case .GenPlural:
                    return stem + "ium"
                case .DatPlural:
                    return stem + "ibus"
                case .AblPlural:
                    return stem + "ibus"
                }
            }
        case NounDeclension.Fourth:
            switch gender{
            case.male:
                let stem = String(genativeS.dropLast(2))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return nominativeS
                case .AccSingular:
                    return stem + "um"
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "ui"
                case .AblSingular:
                    return stem + "u"
                case .NomPlural:
                    return stem + "us"
                case .VocPlural:
                    return stem + "us"
                case .AccPlural:
                    return stem + "us"
                case .GenPlural:
                    return stem + "uum"
                case .DatPlural:
                    return stem + "ibus"
                case .AblPlural:
                    return stem + "ibus"
                }
            case.female:
                let stem = String(genativeS.dropLast(2))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return nominativeS
                case .AccSingular:
                    return stem + "um"
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "ui"
                case .AblSingular:
                    return stem + "u"
                case .NomPlural:
                    return stem + "us"
                case .VocPlural:
                    return stem + "us"
                case .AccPlural:
                    return stem + "us"
                case .GenPlural:
                    return stem + "uum"
                case .DatPlural:
                    return stem + "ibus"
                case .AblPlural:
                    return stem + "ibus"
                }
            //no 4th neuter nouns in ocr
            //leaving domum as 4th masc despite in writings it can have different endings
            case.neuter:
                return "not yet implimented"
            }
        case NounDeclension.Fifth:
            switch gender{
            case Gender.male:
                let stem = String(genativeS.dropLast(2))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return nominativeS
                case .AccSingular:
                    return stem + "em"
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "ei"
                case .AblSingular:
                    return stem + "e"
                case .NomPlural:
                    return stem + "es"
                case .VocPlural:
                    return stem + "es"
                case .AccPlural:
                    return stem + "es"
                case .GenPlural:
                    return stem + "erum"
                case .DatPlural:
                    return stem + "ebus"
                case .AblPlural:
                    return stem + "ebus"
                }
            case Gender.female:
                let stem = String(genativeS.dropLast(2))
                switch choice{
                case .NomSingular:
                    return nominativeS
                case .VocSingular:
                    return nominativeS
                case .AccSingular:
                    return stem + "um"
                case .GenSingular:
                    return genativeS
                case .DatSingular:
                    return stem + "ui"
                case .AblSingular:
                    return stem + "u"
                case .NomPlural:
                    return stem + "us"
                case .VocPlural:
                    return stem + "us"
                case .AccPlural:
                    return stem + "us"
                case .GenPlural:
                    return stem + "uum"
                case .DatPlural:
                    return stem + "ibus"
                case .AblPlural:
                    return stem + "ibus"
                }
            default:
            return"error invalid gender"
            
            }
        default:
            return "cant find declension"
        }
    }
    override func GetFeedback(formAnswer:String,incorrectForm:String) -> [String] {
        let formAnswerList = incorrectForm.split(separator: ",").map{ String($0) }
        let formList = formAnswer.split(separator: ",").map{ String($0) }
        var feedback:[String] = []
        if formAnswerList[0] != formList[0]{
            switch caseNum.init(rawValue: formList[0])! {
            case .NomSingular:
                feedback.append("The noun was in the nominative singular case")
            case .VocSingular:
                feedback.append("The noun was in the vocative singular case")
            case .AccSingular:
                feedback.append("The noun was in the accusative singular case")
            case .GenSingular:
                feedback.append("The noun was in the genative singular case")
            case .DatSingular:
                feedback.append("The noun was in the dative singular case")
            case .AblSingular:
                feedback.append("The noun was in the ablative singular case")
            case .NomPlural:
                feedback.append("The noun was in the nominative plural case")
            case .VocPlural:
                feedback.append("The noun was in the vocative plural case")
            case .AccPlural:
                feedback.append("The noun was in the accusative plural case")
            case .GenPlural:
                feedback.append("The noun was in the general plural case")
            case .DatPlural:
                feedback.append("The noun was in the dative plural case")
            case .AblPlural:
                feedback.append("The noun was in the ablative plural case")
            }
        }
        return feedback
    }
    enum Contex: String, CaseIterable, Encodable{
        case Nom = "The nominaive case is used to show the subject of the sentence, normally the thing doing the action or what the sentenced is sentenced around"
        case Voc = "The vocative case is what we might consider the name of the thing. It is normally the same as the nominative case and shown as following an 'O' "
        case Acc = "The accusative case is the direct object of the sentence, it is usualy what the verb is being done to"
        case Gen = "The genative is used to show possession"
        case Dat = "The dative case is used when the noun is an indirect object, we could think of this as the second object of the sentence, it is ususally translated as to or for the object"
        case Abl = "The ablative case is the instrument case, it describes how an action is done or by what means. It is translated as 'by, with or from'"
        case Sing = "There is only one of the object"
        case Plural = "There is more than one of the object "
    }
}

