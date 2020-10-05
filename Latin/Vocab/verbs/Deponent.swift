//
//  Deponent.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import Foundation
// deponantVerbs are active verbs but are in passive form...becasue humans are weird
class DeponantVerb : Verb{
    override func GetImperfect(str: String)->String{
        if conjugation.suffix(1)=="1" {
            switch str.lowercased(){
            case "1s":
                return stem+"bar"
            case "2s":
                return stem+"baris"
            case "3s":
                return stem+"batur"
            case "1p":
                return stem+"bamur"
            case "2p":
                return stem+"bamini"
            case "3p":
                return stem+"bantur"
            default:
                return "cant find number and person"
            }
        }else{
            switch str.lowercased(){
            case "1s":
                return stem+"ebar"
            case "2s":
                return stem+"ebaris"
            case "3s":
                return stem+"ebatur"
            case "1p":
                return stem+"ebamur"
            case "2p":
                return stem+"ebamini"
            case "3p":
                return stem+"ebantur"
            default:
                return "cant find number and person"
            }
        }
    }
    override func GetPresent(str: String) -> String {
        var infix:String
        /*
         1s = 1st person singular: I
         2s = 2nd person singular: you
         3s = 3rd person singular: he/she/it
         1p = 1st person plural: we
         2p = 2nd person plural: you all
         3p = 3rd persin plural: they
         */
        switch conjugation.prefix(6){
        case "verb 1":
            //1st conjugation
            infix="a"
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return stem+infix+"ris"
            case "3s":
                return stem+infix+"tur"
            case "1p":
                return stem+infix+"mur"
            case "2p":
                return stem+infix+"mini"
            case "3p":
                return stem+infix+"ntur"
            default:
                return "not 1st "
            }
        case "verb 2":
            //2nd conjugation
            infix="e"
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return stem+infix+"ris"
            case "3s":
                return stem+infix+"tur"
            case "1p":
                return stem+infix+"mur"
            case "2p":
                return stem+infix+"mini"
            case "3p":
                return stem+infix+"ntur"
            default:
                return "not 2nd "
            }
        case "verb 3":
            //3rd conjugation
            if present1S.suffix(2)=="ie"{
                infix="ie"
            }else{
                infix="e"
            }
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return stem+infix+"ris"
            case "3s":
                return stem+infix+"tur"
            case "1p":
                return stem+infix+"mur"
            case "2p":
                return stem+infix+"mini"
            case "3p":
                return stem+infix+"ntur"
            default:
                return "not 3rd "
            }
        case "verb 4":
            //4th conjugation
            infix = "i"
            switch str.lowercased() {
            case "1s":
                return present1S
            case "2s":
                return stem+infix+"ris"
            case "3s":
                return stem+infix+"tur"
            case "1p":
                return stem+infix+"mur"
            case "2p":
                return stem+infix+"mini"
            case "3p":
                return stem+infix+"ntur"
            default:
                return "not 4th "
            }
        default:
            return "can't find conjugation"
        }
    }
    override func GetFuture(str: String) -> String{
        var infix:String
        /*
         1s = 1st person singular: I
         2s = 2nd person singular: you
         3s = 3rd person singular: he/she/it
         1p = 1st person plural: we
         2p = 2nd person plural: you all
         3p = 3rd persin plural: they
         */
        switch conjugation.prefix(6){
        case "verb 1":
            //1st conjugation
            infix="a"
            switch str.lowercased() {
            case "1s":
                return stem+infix+"bor"
            case "2s":
                return stem+infix+"beris"
            case "3s":
                return stem+infix+"bitur"
            case "1p":
                return stem+infix+"bimur"
            case "2p":
                return stem+infix+"bimini"
            case "3p":
                return stem+infix+"buntur"
            default:
                return "not 1st "
            }
        case "verb 2":
            //2nd conjugation
            infix="e"
            switch str.lowercased() {
            case "1s":
                return stem+infix+"bor"
            case "2s":
                return stem+infix+"boris"
            case "3s":
                return stem+infix+"bitur"
            case "1p":
                return stem+infix+"bimur"
            case "2p":
                return stem+infix+"bimini"
            case "3p":
                return stem+infix+"buntur"
            default:
                return "not 2nd "
            }
        case "verb 3":
            //3rd conjugation
            if present1S.suffix(2)=="ie"{
                infix="ie"
            }else{
                infix="e"
            }
            switch str.lowercased() {
            case "1s":
                return stem+"i"+"ar"
            case "2s":
                return stem+infix+"eris"
            case "3s":
                return stem+infix+"etur"
            case "1p":
                return stem+infix+"emur"
            case "2p":
                return stem+infix+"emini"
            case "3p":
                return stem+infix+"entur"
            default:
                return "not 3rd "
            }
        case "verb 4":
            return "no 4th"
        default:
            return "cant find declenlsion"
            
        }
    }
    // need to sort out semi deponent and deponent verbs for perfect and such
    override func GetPerfect(str: String) -> String {
        return "not implimented"
    }
    override func GetPluperfect(str: String) -> String {
        return "not implimented"
    }
    override func GetSubjunctiveVowel() -> String {
        return "not implimented"
    }
    override func GetSubjunctivePresent(str: String) -> String {
        return "not implimented"
    }
    override func GetSubjunctiveImperfect(str: String) -> String {
        return "not implimented"
    }
    override func GetSubjunctivePerfect(str: String) -> String {
        return "not implimented"
    }
    override func GetSubjunctivePluperfect(str: String) -> String {
        return "not yet implimented"
    }
    override func GetPassiveIndicitivePresent(str:String) -> String{
        return "not implimented"
    }
    override func GetPassiveIndicitiveImperfect(str:String)-> String{
        return "not implimented"
    }
    override func GetPassiveIndicitiveFuture(str:String)-> String{
        return "not impliemented"
    }
    override func GetPassiveIndicitivePerfect(str:String,gender:String)-> String{
        return "not implimented"
    }
    override func GetPassiveIndicitivePluperfect(str:String,gender:String)-> String{
        return "not implimented"
    }
    override func GetPassiveSubjunctivePerfect(str:String,gender:String)-> String{
        return "not implimented"
    }
    override func GetPassiveSubjunctivePluperfect(str:String,gender:String)-> String{
        return "not implimented"
    }
    override func GetPassiveSubjunctivePresent(str:String)->String{
        return "not implimented"
    }
    override func GetPassiveSubjunctiveImperfect(str:String)->String{
        return "not implimented"
    }
}
