//
//  Deponent.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
//DEPONANT VERBS ARE A SPECIAL CASE OF WORDS THEY ACT LIKE ACTIVE VERBS BUT ARE GIVEN IN PASSIVE FORM...WHICH IS VERY ANNOYING
// deponantVerbs are active verbs but are in passive form...becasue humans are weird
class DeponantVerb : Verb{
    override func GetImperfect(personNum: PersonNum)->String{
        if conjugation == .First {
            switch personNum{
            case .FirstSingular:
                return stem+"bar"
            case .SecondSingular:
                return stem+"baris"
            case .ThirdSingular:
                return stem+"batur"
            case .FirstPlural:
                return stem+"bamur"
            case .SecondPlural:
                return stem+"bamini"
            case .ThirdPlural:
                return stem+"bantur"
            }
        }else{
            switch personNum{
            case .FirstSingular:
                return stem+"ebar"
            case .SecondSingular:
                return stem+"ebaris"
            case .ThirdSingular:
                return stem+"ebatur"
            case .FirstPlural:
                return stem+"ebamur"
            case .SecondPlural:
                return stem+"ebamini"
            case .ThirdPlural:
                return stem+"ebantur"
            }
        }
    }
    override func GetPresent(personNum: PersonNum) -> String {
        var infix:String
        /*
         1s = 1st person singular: I
         2s = 2nd person singular: you
         3s = 3rd person singular: he/she/it
         1p = 1st person plural: we
         2p = 2nd person plural: you all
         3p = 3rd persin plural: they
         */
        switch conjugation{
        case .First:
            //1st conjugation
            infix="a"
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return stem+infix+"ris"
            case .ThirdSingular:
                return stem+infix+"tur"
            case .FirstPlural:
                return stem+infix+"mur"
            case .SecondPlural:
                return stem+infix+"mini"
            case .ThirdPlural:
                return stem+infix+"ntur"
            }
        case .Second:
            //2nd conjugation
            infix="e"
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return stem+infix+"ris"
            case .ThirdSingular:
                return stem+infix+"tur"
            case .FirstPlural:
                return stem+infix+"mur"
            case .SecondPlural:
                return stem+infix+"mini"
            case .ThirdPlural:
                return stem+infix+"ntur"
            }
        case .Third:
            //3rd conjugation
            if present1S.suffix(2)=="ie"{
                infix="ie"
            }else{
                infix="e"
            }
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return stem+infix+"ris"
            case .ThirdSingular:
                return stem+infix+"tur"
            case .FirstPlural:
                return stem+infix+"mur"
            case .SecondPlural:
                return stem+infix+"mini"
            case .ThirdPlural:
                return stem+infix+"ntur"
            }
        case .Fourth:
            //4th conjugation
            infix = "i"
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return stem+infix+"ris"
            case .ThirdSingular:
                return stem+infix+"tur"
            case .FirstPlural:
                return stem+infix+"mur"
            case .SecondPlural:
                return stem+infix+"mini"
            case .ThirdPlural:
                return stem+infix+"ntur"
            }
        default:
            return "can't find conjugation"
        }
    }
    override func GetFuture(personNum: PersonNum) -> String{
        var infix:String
        /*
         1s = 1st person singular: I
         2s = 2nd person singular: you
         3s = 3rd person singular: he/she/it
         1p = 1st person plural: we
         2p = 2nd person plural: you all
         3p = 3rd persin plural: they
         */
        switch conjugation{
        case .First:
            //1st conjugation
            infix="a"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bor"
            case .SecondSingular:
                return stem+infix+"beris"
            case .ThirdSingular:
                return stem+infix+"bitur"
            case .FirstPlural:
                return stem+infix+"bimur"
            case .SecondPlural:
                return stem+infix+"bimini"
            case .ThirdPlural:
                return stem+infix+"buntur"
            }
        case .Second:
            //2nd conjugation
            infix="e"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bor"
            case .SecondSingular:
                return stem+infix+"boris"
            case .ThirdSingular:
                return stem+infix+"bitur"
            case .FirstPlural:
                return stem+infix+"bimur"
            case .SecondPlural:
                return stem+infix+"bimini"
            case .ThirdPlural:
                return stem+infix+"buntur"
            }
        case .Third:
            //3rd conjugation
            if present1S.suffix(2)=="ie"{
                infix="ie"
            }else{
                infix="e"
            }
            switch personNum {
            case .FirstSingular:
                return stem+"i"+"ar"
            case .SecondSingular:
                return stem+infix+"eris"
            case .ThirdSingular:
                return stem+infix+"etur"
            case .FirstPlural:
                return stem+infix+"emur"
            case .SecondPlural:
                return stem+infix+"emini"
            case .ThirdPlural:
                return stem+infix+"entur"
            }
        case .Fourth:
            return "no 4th"
        default:
            return "cant find declenlsion"
            
        }
    }
    // need to sort out semi deponent and deponent verbs for perfect and such
    override func GetPerfect(personNum: PersonNum) -> String {
        return "not implimented"
    }
    override func GetPluperfect(personNum: PersonNum) -> String {
        return "not implimented"
    }
    override func GetSubjunctiveVowel() -> String {
        return "not implimented"
    }
    override func GetSubjunctivePresent(personNum: PersonNum) -> String {
        return "not implimented"
    }
    override func GetSubjunctiveImperfect(personNum: PersonNum) -> String {
        return "not implimented"
    }
    override func GetSubjunctivePerfect(personNum: PersonNum) -> String {
        return "not implimented"
    }
    override func GetSubjunctivePluperfect(personNum: PersonNum) -> String {
        return "not yet implimented"
    }
    override func GetPassiveIndicitivePresent(personNum:PersonNum) -> String{
        return "not implimented"
    }
    override func GetPassiveIndicitiveImperfect(personNum:PersonNum)-> String{
        return "not implimented"
    }
    override func GetPassiveIndicitiveFuture(personNum:PersonNum)-> String{
        return "not impliemented"
    }
    override func GetPassiveIndicitivePerfect(personNum:PersonNum,gender:String)-> String{
        return "not implimented"
    }
    override func GetPassiveIndicitivePluperfect(personNum:PersonNum,gender:String)-> String{
        return "not implimented"
    }
    override func GetPassiveSubjunctivePerfect(personNum:PersonNum,gender:String)-> String{
        return "not implimented"
    }
    override func GetPassiveSubjunctivePluperfect(personNum:PersonNum,gender:String)-> String{
        return "not implimented"
    }
    override func GetPassiveSubjunctivePresent(personNum:PersonNum)->String{
        return "not implimented"
    }
    override func GetPassiveSubjunctiveImperfect(personNum:PersonNum)->String{
        return "not implimented"
    }
}
