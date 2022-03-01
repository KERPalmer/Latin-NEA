//
//  adjectives.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 15/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
//ADJECTIVES - THIS CLASS WILL DEAL WITH THE 2 ADJECTIVE DECLENSION HANDLE ALL THE METHODS TO GET THE DIFFERENT FORMS
class Adjective:Word, Codable{
    public let declension:AdjectiveDeclension
    public var mascNom:String
    override init(line: String, id_: Int){
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "") // remove line break
        let commaSplit=(trimmed.split(separator: ",", omittingEmptySubsequences: true)).map { String($0) }
        self.mascNom=String(format(str: commaSplit[0]))
        if trimmed.contains("1/2"){
            declension = AdjectiveDeclension.TwoOneTwo
        }else if trimmed.contains("3"){
            declension = AdjectiveDeclension.third
        }else{
            declension = AdjectiveDeclension.indeclinable
        }
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    override func GetFeedback(formAnswer:String,incorrectForm:String)->[String]{
        let formAnswerList = incorrectForm.split(separator: ",").map{ String($0) }
        let formList = formAnswer.split(separator: ",").map{ String($0) }
        var feedback:[String] = []
        if formAnswerList[0] != formList[0]{
            var feedbackPart: String = ""
            switch AdjectiveDegree.init(rawValue: formList[0])! {
            case .positive:
                feedbackPart.append("the adjective was in the positive degree")
            case .comparative:
                feedbackPart.append("The adjective was in the comparative degree")
            case .superlatative:
                feedbackPart.append("The adjective was in the superlatative degree")
            case .adverb:
                feedbackPart.append("The adjective was in the adverb degree")
            case .indeclinable:
                feedbackPart.append("The adjevtive was indeclinable")
            }
            switch AdjectiveDegree.init(rawValue: formAnswerList[0])!{
            case .positive:
                feedbackPart.append(", you gave it in the positive degree")
            case .comparative:
                feedbackPart.append(", you gave it in the comparative degree")
            case .superlatative:
                feedbackPart.append(", you gave it in the superlatative degree")
            case .adverb:
                feedbackPart.append(", you gave it in the adverb form")
            case .indeclinable:
                feedbackPart.append(", you said it was indeclinable")
            }
            feedback.append(feedbackPart)
        }
        if formAnswerList[1] != formList[1]{
            var feedbackPart:String = ""
            switch caseNum.init(rawValue: formList[1])!{
            case .NomSingular:
                feedbackPart.append("the adjective was in the nominative singular form")
            case .VocSingular:
                feedbackPart.append("the adjective was in the vocative singular form")
            case .AccSingular:
                feedbackPart.append("the adjective was in the accusative singular form")
            case .GenSingular:
                feedbackPart.append("the adjective was in the genative singular form")
            case .DatSingular:
                feedbackPart.append("the adjective was in the dative singular form")
            case .AblSingular:
                feedbackPart.append("the adjective was in the ablative singular form")
            case .NomPlural:
                feedbackPart.append("the adjective was in the nominative plural form")
            case .VocPlural:
                feedbackPart.append("the adjective was in the vocative plural form")
            case .AccPlural:
                feedbackPart.append("the adjective was in the accusative plural form")
            case .GenPlural:
                feedbackPart.append("the adjective was in the genative plural form")
            case .DatPlural:
                feedbackPart.append("the adjective was in the dative plural form")
            case .AblPlural:
                feedbackPart.append("the adjective was in the ablative plural form")
            }
            switch caseNum.init(rawValue: formAnswerList[1])!{
            case .NomSingular:
                feedbackPart.append("you gave it in the nominative singular")
            case .VocSingular:
                feedbackPart.append("you gave it in the vocative singular form")
            case .AccSingular:
                feedbackPart.append("you gave it in the accusative singular form")
            case .GenSingular:
                feedbackPart.append("you gave it in the genative singular form")
            case .DatSingular:
                feedbackPart.append("you gave it in the dative singular form")
            case .AblSingular:
                feedbackPart.append("you gave it in the ablative singular form")
            case .NomPlural:
                feedbackPart.append("you gave it in the nominative plural form")
            case .VocPlural:
                feedbackPart.append("you gave it in the vocative plural form")
            case .AccPlural:
                feedbackPart.append("you gave it in the accusative plural form")
            case .GenPlural:
                feedbackPart.append("you gave it in the genative plural form")
            case .DatPlural:
                feedbackPart.append("you gave it in the dative plural form")
            case .AblPlural:
                feedbackPart.append("you gave it in the ablative plural form")
            }
            feedback.append(feedbackPart)
        }
        if formAnswerList[2] != formList[2]{
            var feedbackPart:String = ""
            switch Gender.init(rawValue: formList[2])! {
            case.male:
                feedbackPart.append("the adjective was in the male form")
            case .female:
                feedbackPart.append("the adjective was in the female form")
            case .neuter:
                feedbackPart.append("the adjective was in the neuter form")
            }
            switch Gender.init(rawValue: formAnswerList[2])! {
            case.male:
                feedbackPart.append("you gave it in the male form")
            case .female:
                feedbackPart.append("you gave it was in the female form")
            case .neuter:
                feedbackPart.append("you gave it was in the neuter form")
            }
            feedback.append(feedbackPart)
        }
        return feedback
    }
    
    enum contex:String, CaseIterable, Encodable{
        case Nom = "The nominaive case is used to show the adjective describes the object of the sentence, normally the thing doing the action or what the sentenced is sentenced around"
        case Voc = "The vocative case is used to show to adjective describes the person being address. It is normally the same as the nominative case and shown as following an 'O'"
        case Acc = "The accusative case is used to show that the adjective describes the direct object of the sentence."
        case Gen = "The genative case is used to show the adjective describing a possession"
        case Dat = "The dative case is used to show that the adjective is describing an indirect object, we could think of this as the second object of the sentence, it is ususally translated as to or for that object"
        case Abl = "The ablative case is used to show that the adjective is describing an instrument, it describes how an action is done or by what means. It is translated as 'by, with or from'"
        case Sing = "The adjective only describes one of the object"
        case Plural = "The adjective describes more than one object"
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
        if trimmed.contains("plural"){ // if plural only
            mascStem = String(String(format(str: speechSplit[0])).dropLast(1))
            self.femStem=String(genders[0].dropLast(2))
            self.neuStem=String(genders[1].dropLast(1))
        }else{
        self.mascStem=String(String(format(str: speechSplit[0])).dropLast(2))
        self.femStem=String(genders[0].dropLast(1))
        self.neuStem=String(genders[1].dropLast(2))
        }
        self.femNom=String(genders[0])
        self.neuNom=String(genders[1])
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    func get_positive(gender: Gender,CaseNum:caseNum)->String{
        switch gender{
        case .male:
            switch CaseNum {
            case .NomSingular:
                return mascStem + "us"
            case .NomPlural:
                return mascStem + "i"
            case  .VocSingular:
                return mascStem + "e"
            case .VocPlural:
                return mascStem + "i"
            case .AccSingular:
                return mascStem + "um"
            case .AccPlural:
                return mascStem + "os"
            case .GenSingular:
                return mascStem + "i"
            case .GenPlural:
                return mascStem + "orum"
            case .DatSingular:
                return mascStem + "o"
            case .DatPlural:
                return mascStem + "is"
            case .AblSingular:
                return mascStem + "o"
            case.AblPlural:
                return mascStem + "is"
            }
        case .female:
            switch CaseNum {
            case .NomSingular:
                return femStem + "a"
            case .NomPlural:
                return femStem + "ae"
            case  .VocSingular:
                return femStem + "a"
            case .VocPlural:
                return femStem + "ae"
            case .AccSingular:
                return femStem + "am"
            case .AccPlural:
                return femStem + "as"
            case .GenSingular:
                return femStem + "ae"
            case .GenPlural:
                return femStem + "arum"
            case .DatSingular:
                return femStem + "ae"
            case .DatPlural:
                return femStem + "is"
            case .AblSingular:
                return femStem + "a"
            case.AblPlural:
                return femStem + "is"
            }
        case .neuter:
            switch CaseNum {
            case .NomSingular:
                return neuStem + "um"
            case .NomPlural:
                return neuStem + "a"
            case  .VocSingular:
                return neuStem + "um"
            case .VocPlural:
                return neuStem + "a"
            case .AccSingular:
                return neuStem + "um"
            case .AccPlural:
                return neuStem + "a"
            case .GenSingular:
                return neuStem + "i"
            case .GenPlural:
                return neuStem + "orum"
            case .DatSingular:
                return neuStem + "o"
            case .DatPlural:
                return neuStem + "is"
            case .AblSingular:
                return neuStem + "o"
            case.AblPlural:
                return neuStem + "is"
            }
        }
    }
    func get_comparative(gender:Gender, CaseNum:caseNum)->String{
        let mascFemEnding = "ior"
        let neuterEnding = "ius"
        switch gender{
        case .male:
            switch CaseNum {
            case .NomSingular:
                return femStem + mascFemEnding
            case .VocSingular:
                return femStem + mascFemEnding
            case .AccSingular:
                return femStem + mascFemEnding + "em"
            case .GenSingular:
                return femStem + mascFemEnding + "is"
            case .DatSingular:
                return femStem + mascFemEnding + "i"
            case .AblSingular:
                return femStem + mascFemEnding + "e"
            case .NomPlural:
                return femStem + mascFemEnding + "es"
            case .VocPlural:
                return femStem + mascFemEnding + "es"
            case .AccPlural:
                return femStem + mascFemEnding + "es"
            case .GenPlural:
                return femStem + mascFemEnding + "um"
            case .DatPlural:
                return femStem + mascFemEnding + "ibus"
            case .AblPlural:
                return femStem + mascFemEnding + "ibus"
            }
        case .female:
            switch CaseNum {
            case .NomSingular:
                return femStem + mascFemEnding
            case .VocSingular:
                return femStem + mascFemEnding
            case .AccSingular:
                return femStem + mascFemEnding + "em"
            case .GenSingular:
                return femStem + mascFemEnding + "is"
            case .DatSingular:
                return femStem + mascFemEnding + "i"
            case .AblSingular:
                return femStem + mascFemEnding + "e"
            case .NomPlural:
                return femStem + mascFemEnding + "es"
            case .VocPlural:
                return femStem + mascFemEnding + "es"
            case .AccPlural:
                return femStem + mascFemEnding + "es"
            case .GenPlural:
                return femStem + mascFemEnding + "um"
            case .DatPlural:
                return femStem + mascFemEnding + "ibus"
            case .AblPlural:
                return femStem + mascFemEnding + "ibus"
            }
        case .neuter:
            switch CaseNum {
            case .NomSingular:
                return neuStem + neuterEnding
            case .VocSingular:
                return neuStem + neuterEnding
            case .AccSingular:
                return neuStem + neuterEnding
            case .GenSingular:
                return femStem + mascFemEnding + "is"
            case .DatSingular:
                return femStem + mascFemEnding + "i"
            case .AblSingular:
                return femStem + mascFemEnding + "e"
            case .NomPlural:
                return femStem + mascFemEnding + "a"
            case .VocPlural:
                return femStem + mascFemEnding + "a"
            case .AccPlural:
                return femStem + mascFemEnding + "es"
            case .GenPlural:
                return femStem + mascFemEnding + "um"
            case .DatPlural:
                return femStem + mascFemEnding + "ibus"
            case .AblPlural:
                return femStem + mascFemEnding + "ibus"
            }
        }
    }
    func get_superlative(gender:Gender, CaseNum:caseNum)->String{
        let superlativeInfix = "issim"
        switch gender{
        case .male:
            switch CaseNum {
            case .NomSingular:
                return femStem + superlativeInfix + "us"
            case .VocSingular:
                return femStem + superlativeInfix + "us"
            case .AccSingular:
                return femStem + superlativeInfix + "um"
            case .GenSingular:
                return femStem + superlativeInfix + "i"
            case .DatSingular:
                return femStem + superlativeInfix + "o"
            case .AblSingular:
                return femStem + superlativeInfix + "o"
            case .NomPlural:
                return femStem + superlativeInfix + "i"
            case .VocPlural:
                return femStem + superlativeInfix + "i"
            case .AccPlural:
                return femStem + superlativeInfix + "os"
            case .GenPlural:
                return femStem + superlativeInfix + "orum"
            case .DatPlural:
                return femStem + superlativeInfix + "is"
            case .AblPlural:
                return femStem + superlativeInfix + "is"
            }
        case .female:
            switch CaseNum {
            case .NomSingular:
                return femStem + superlativeInfix + "a"
            case .VocSingular:
                return femStem + superlativeInfix + "a"
            case .AccSingular:
                return femStem + superlativeInfix + "am"
            case .GenSingular:
                return femStem + superlativeInfix + "ae"
            case .DatSingular:
                return femStem + superlativeInfix + "o"
            case .AblSingular:
                return femStem + superlativeInfix + "o"
            case .NomPlural:
                return femStem + superlativeInfix + "ae"
            case .VocPlural:
                return femStem + superlativeInfix + "ae"
            case .AccPlural:
                return femStem + superlativeInfix + "as"
            case .GenPlural:
                return femStem + superlativeInfix + "arum"
            case .DatPlural:
                return femStem + superlativeInfix + "is"
            case .AblPlural:
                return femStem + superlativeInfix + "is"
            }
        case .neuter:
            switch CaseNum {
            case .NomSingular:
                return femStem + superlativeInfix + "um"
            case .VocSingular:
                return femStem + superlativeInfix + "um"
            case .AccSingular:
                return femStem + superlativeInfix + "um"
            case .GenSingular:
                return femStem + superlativeInfix + "i"
            case .DatSingular:
                return femStem + superlativeInfix + "o"
            case .AblSingular:
                return femStem + superlativeInfix + "o"
            case .NomPlural:
                return femStem + superlativeInfix + "a"
            case .VocPlural:
                return femStem + superlativeInfix + "a"
            case .AccPlural:
                return femStem + superlativeInfix + "a"
            case .GenPlural:
                return femStem + superlativeInfix + "orum"
            case .DatPlural:
                return femStem + superlativeInfix + "is"
            case .AblPlural:
                return femStem + superlativeInfix + "is"
            }
        }
    }
    func get_adverb()->String{
        return femStem + "e"
    }
    override func GetForm(formString: [String]) -> String {
        let gender = Gender.init(rawValue: formString[2]) ?? .male
        let CaseNum = caseNum.init(rawValue: formString[1]) ?? .NomSingular
        switch AdjectiveDegree.init(rawValue: formString[0]) ?? .positive{
        case .positive:
            return get_positive(gender: gender , CaseNum: CaseNum)
        case .comparative:
            return get_comparative(gender: gender, CaseNum: CaseNum)
        case .superlatative:
            return get_superlative(gender: gender, CaseNum: CaseNum)
        case .adverb:
            return get_adverb()
        case .indeclinable:
            return firstPrincipalPart
        }
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
    func get_positive(gender: Gender,CaseNum:caseNum)->String{
        switch gender{
        case .male:
            switch CaseNum {
            case .NomSingular:
                return firstPrincipalPart
            case .NomPlural:
                return stem + "es"
            case  .VocSingular:
                return firstPrincipalPart
            case .VocPlural:
                return stem + "es"
            case .AccSingular:
                return stem + "em"
            case .AccPlural:
                return stem + "is"
            case .GenSingular:
                return stem + "is"
            case .GenPlural:
                return stem + "ium"
            case .DatSingular:
                return stem + "i"
            case .DatPlural:
                return stem + "ibus"
            case .AblSingular:
                return stem + "i"
            case.AblPlural:
                return stem + "ibus"
            }
        case .female:
            switch CaseNum {
            case .NomSingular:
                return stem + "is"
            case .NomPlural:
                return stem + "es"
            case  .VocSingular:
                return stem + "is"
            case .VocPlural:
                return stem + "es"
            case .AccSingular:
                return stem + "em"
            case .AccPlural:
                return stem + "is"
            case .GenSingular:
                return stem + "is"
            case .GenPlural:
                return stem + "ium"
            case .DatSingular:
                return stem + "i"
            case .DatPlural:
                return stem + "ibus"
            case .AblSingular:
                return stem + "i"
            case.AblPlural:
                return stem + "ibus"
            }
        case .neuter:
            switch CaseNum {
            case .NomSingular:
                return stem + "e"
            case .NomPlural:
                return stem + "ia"
            case  .VocSingular:
                return stem + "e"
            case .VocPlural:
                return stem + "ia"
            case .AccSingular:
                return stem + "e"
            case .AccPlural:
                return stem + "ia"
            case .GenSingular:
                return stem + "is"
            case .GenPlural:
                return stem + "ium"
            case .DatSingular:
                return stem + "i"
            case .DatPlural:
                return stem + "ibus"
            case .AblSingular:
                return stem + "i"
            case.AblPlural:
                return stem + "ibus"
            }
        }
    }
    func get_comparative(gender:Gender, CaseNum:caseNum)->String{
        let mascFemEnding = "ior"
        let neuterEnding = "ius"
        switch gender{
        case .male:
            switch CaseNum {
            case .NomSingular:
                return stem + mascFemEnding
            case .VocSingular:
                return stem + mascFemEnding
            case .AccSingular:
                return stem + mascFemEnding + "em"
            case .GenSingular:
                return stem + mascFemEnding + "is"
            case .DatSingular:
                return stem + mascFemEnding + "i"
            case .AblSingular:
                return stem + mascFemEnding + "e"
            case .NomPlural:
                return stem + mascFemEnding + "es"
            case .VocPlural:
                return stem + mascFemEnding + "es"
            case .AccPlural:
                return stem + mascFemEnding + "es"
            case .GenPlural:
                return stem + mascFemEnding + "um"
            case .DatPlural:
                return stem + mascFemEnding + "ibus"
            case .AblPlural:
                return stem + mascFemEnding + "ibus"
            }
        case .female:
            switch CaseNum {
            case .NomSingular:
                return stem + mascFemEnding
            case .VocSingular:
                return stem + mascFemEnding
            case .AccSingular:
                return stem + mascFemEnding + "em"
            case .GenSingular:
                return stem + mascFemEnding + "is"
            case .DatSingular:
                return stem + mascFemEnding + "i"
            case .AblSingular:
                return stem + mascFemEnding + "e"
            case .NomPlural:
                return stem + mascFemEnding + "es"
            case .VocPlural:
                return stem + mascFemEnding + "es"
            case .AccPlural:
                return stem + mascFemEnding + "es"
            case .GenPlural:
                return stem + mascFemEnding + "um"
            case .DatPlural:
                return stem + mascFemEnding + "ibus"
            case .AblPlural:
                return stem + mascFemEnding + "ibus"
            }
        case .neuter:
            switch CaseNum {
            case .NomSingular:
                return stem + neuterEnding
            case .VocSingular:
                return stem + neuterEnding
            case .AccSingular:
                return stem + neuterEnding
            case .GenSingular:
                return stem + mascFemEnding + "is"
            case .DatSingular:
                return stem + mascFemEnding + "i"
            case .AblSingular:
                return stem + mascFemEnding + "e"
            case .NomPlural:
                return stem + mascFemEnding + "a"
            case .VocPlural:
                return stem + mascFemEnding + "a"
            case .AccPlural:
                return stem + mascFemEnding + "es"
            case .GenPlural:
                return stem + mascFemEnding + "um"
            case .DatPlural:
                return stem + mascFemEnding + "ibus"
            case .AblPlural:
                return stem + mascFemEnding + "ibus"
            }
        }
    }
    func get_superlative(gender:Gender, CaseNum:caseNum)->String{
        let superlativeInfix = "issim"
        switch gender{
        case .male:
            switch CaseNum {
            case .NomSingular:
                return stem + superlativeInfix + "us"
            case .VocSingular:
                return stem + superlativeInfix + "us"
            case .AccSingular:
                return stem + superlativeInfix + "um"
            case .GenSingular:
                return stem + superlativeInfix + "i"
            case .DatSingular:
                return stem + superlativeInfix + "o"
            case .AblSingular:
                return stem + superlativeInfix + "o"
            case .NomPlural:
                return stem + superlativeInfix + "i"
            case .VocPlural:
                return stem + superlativeInfix + "i"
            case .AccPlural:
                return stem + superlativeInfix + "os"
            case .GenPlural:
                return stem + superlativeInfix + "orum"
            case .DatPlural:
                return stem + superlativeInfix + "is"
            case .AblPlural:
                return stem + superlativeInfix + "is"
            }
        case .female:
            switch CaseNum {
            case .NomSingular:
                return stem + superlativeInfix + "a"
            case .VocSingular:
                return stem + superlativeInfix + "a"
            case .AccSingular:
                return stem + superlativeInfix + "am"
            case .GenSingular:
                return stem + superlativeInfix + "ae"
            case .DatSingular:
                return stem + superlativeInfix + "o"
            case .AblSingular:
                return stem + superlativeInfix + "o"
            case .NomPlural:
                return stem + superlativeInfix + "ae"
            case .VocPlural:
                return stem + superlativeInfix + "ae"
            case .AccPlural:
                return stem + superlativeInfix + "as"
            case .GenPlural:
                return stem + superlativeInfix + "arum"
            case .DatPlural:
                return stem + superlativeInfix + "is"
            case .AblPlural:
                return stem + superlativeInfix + "is"
            }
        case .neuter:
            switch CaseNum {
            case .NomSingular:
                return stem + superlativeInfix + "um"
            case .VocSingular:
                return stem + superlativeInfix + "um"
            case .AccSingular:
                return stem + superlativeInfix + "um"
            case .GenSingular:
                return stem + superlativeInfix + "i"
            case .DatSingular:
                return stem + superlativeInfix + "o"
            case .AblSingular:
                return stem + superlativeInfix + "o"
            case .NomPlural:
                return stem + superlativeInfix + "a"
            case .VocPlural:
                return stem + superlativeInfix + "a"
            case .AccPlural:
                return stem + superlativeInfix + "a"
            case .GenPlural:
                return stem + superlativeInfix + "orum"
            case .DatPlural:
                return stem + superlativeInfix + "is"
            case .AblPlural:
                return stem + superlativeInfix + "is"
            }
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
