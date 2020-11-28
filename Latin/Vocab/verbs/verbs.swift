//
//  Deponent.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

class Verb:Word,Codable{
    // using the pricipal parts we should in theory be able to derive any tense, person or voice
    public let present1S:String
    public let infinitive:String
    public let future1S:String
    public let perfectParticipal:String
    public var conjugation:String
    public var stem:String
    public var isUsed:Bool
    override init(line:String, id_:Int){
        isUsed=true
        let trimmed:String=line.replacingOccurrences(of: "\r", with: "")
        let seperated=(trimmed.split(separator: "\"", omittingEmptySubsequences: true)).map { String($0) }
        // form 1: present1s,"infinitive, furture1s?, pastParticipal?",verb (int),"translation1,translation2,..."
        // form 2: present1s,"infinitive, furture1s?, pastParticipal?",verb (int), only translation
        // form 3: cause inquit is annoying : present1s,verb (int)/irregular, "translation1 , translation2,..."
        if seperated.count==4{
            //form 1
            present1S=format(str: seperated[0])
            let otherParts:String=seperated[1]
            let splitParts=otherParts.split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            //check for other parts presence
            if splitParts.count==0{
                infinitive=""
                future1S=""
                perfectParticipal=""
            }else if splitParts.count==1{
                //only infinitive
                infinitive=format(str:splitParts[0])
                future1S=""
                perfectParticipal=""
            }else if splitParts.count==2{
                //infinitive and furture 1st singular
                infinitive=format(str:splitParts[0])
                future1S=format(str:splitParts[1])
                perfectParticipal=""
            }else{
                //all 3 of them
                infinitive=format(str:splitParts[0])
                future1S=format(str:splitParts[1])
                perfectParticipal=format(str:splitParts[2])
            }
            // look for conjugation
            conjugation=format(str:seperated[2])
        }
        else if seperated.count==3{
            //form 2
            present1S=format(str: seperated[0])
            let otherParts:String=seperated[1]
            let splitParts=otherParts.split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            //check for other parts presence
            if splitParts.count==0{
                // no parts
                infinitive=""
                future1S=""
                perfectParticipal=""
            }else if splitParts.count==1{
                // only infinitive
                infinitive=format(str:splitParts[0])
                future1S=""
                perfectParticipal=""
            }else if splitParts.count==2{
                // infinitve and furture 1st singular
                infinitive=format(str:splitParts[0])
                future1S=format(str:splitParts[1])
                perfectParticipal=""
            }else{
                // all of them
                infinitive=format(str:splitParts[0])
                future1S=format(str:splitParts[1])
                perfectParticipal=format(str:splitParts[2])
            }
            // seperate the conjugation and translation
            let splitTypeAndTrans = seperated[2].split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            conjugation=format(str:splitTypeAndTrans[0])
        }
        else{
            // prevents crashing
            present1S=""
            infinitive=""
            future1S=""
            perfectParticipal="null"
            conjugation="null"
            stem="null"
        }
        // stem is drop the "re" and the letter for each conjugation
        stem=String(infinitive.dropLast(3))
        super.init(line: line, id_: id_)
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
    // translation should be in the form of a list, with each element a different translation/synonim
    /*
     1s = 1st person singular: I
     2s = 2nd person singular: you
     3s = 3rd person singular: he/she/it
     1p = 1st person plural: we
     2p = 2nd person plural: you all
     3p = 3rd persin plural: they
     */
    func GetImperfect(str: String)->String{
        var infix:String
        switch conjugation.suffix(1) {
        case "1":
            //1st conjugation
            infix="a"
            switch str {
            case "1s":
                return stem+infix+"bam"
            case "2s":
                return stem+infix+"bas"
            case "3s":
                return stem+infix+"bat"
            case "1p":
                return stem+infix+"bamus"
            case "2p":
                return stem+infix+"batis"
            case "3p":
                return stem+infix+"bant"
            default:
                return "not valid input "
            }
        case "2":
            //2nd conjugation
            infix="e"
            switch str {
            case "1s":
                return stem+infix+"bam"
            case "2s":
                return stem+infix+"bas"
            case "3s":
                return stem+infix+"bat"
            case "1p":
                return stem+infix+"bamus"
            case "2p":
                return stem+infix+"batis"
            case "3p":
                return stem+infix+"bant"
            default:
                return "not valid input "
            }
        case "3":
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="ie"
            }else{
                infix="e"
            }
            switch str {
            case "1s":
                return stem+infix+"bam"
            case "2s":
                return stem+infix+"bas"
            case "3s":
                return stem+infix+"bat"
            case "1p":
                return stem+infix+"bamus"
            case "2p":
                return stem+infix+"batis"
            case "3p":
                return stem+infix+"bant"
            default:
                return "not valid input "
            }
        case "4":
            //4th conjugation
            infix="ie"
            switch str {
            case "1s":
                return stem+infix+"bam"
            case "2s":
                return stem+infix+"bas"
            case "3s":
                return stem+infix+"bat"
            case "1p":
                return stem+infix+"bamus"
            case "2p":
                return stem+infix+"batis"
            case "3p":
                return stem+"i"+"bant"
            default:
                return "not valid input "
            }
        default:
            return "not valid input"
        }
    }
    func GetPresent(str:String)->String{
        var infix:String
        switch conjugation.suffix(1) {
        case "1":
            //1st conjugation
            infix="a"
            switch str {
            case "1s":
                return present1S
            case "2s":
                return stem+infix+"s"
            case "3s":
                return stem+infix+"t"
            case "1p":
                return stem+infix+"mus"
            case "2p":
                return stem+infix+"tis"
            case "3p":
                return stem+infix+"nt"
            default:
                return "not valid input "
            }
        case "2":
            //2nd conjugation
            infix="e"
            switch str {
            case "1s":
                return present1S
            case "2s":
                return stem+infix+"s"
            case "3s":
                return stem+infix+"t"
            case "1p":
                return stem+infix+"mus"
            case "2p":
                return stem+infix+"tis"
            case "3p":
                return stem+infix+"nt"
            default:
                return "not valid input "
            }
        case "3":
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="ie"
            }else{
                infix="i"
            }
            switch str {
            case "1s":
                return present1S
            case "2s":
                return stem+infix+"s"
            case "3s":
                return stem+infix+"t"
            case "1p":
                return stem+infix+"mus"
            case "2p":
                return stem+infix+"tis"
            case "3p":
                if String(present1S.suffix(2))=="io"{
                    return stem+"iu"+"nt"
                }else{
                    return stem+"u"+"nt"
                }
            default:
                return "not valid input "
            }
        case "4":
            //4th conjugation
            infix="i"
            switch str {
            case "1s":
                return present1S
            case "2s":
                return stem+infix+"s"
            case "3s":
                return stem+infix+"t"
            case "1p":
                return stem+infix+"mus"
            case "2p":
                return stem+infix+"tis"
            case "3p":
                return stem+infix+"nt"
            default:
                return "not valid input "
            }
        default:
            return "not valid input"
        }
    }
    func GetFuture(str:String)->String{
        var infix:String
        switch conjugation.suffix(1) {
        case "1":
            //1st conjugation
            infix="a"
            switch str {
            case "1s":
                return stem+infix+"bo"
            case "2s":
                return stem+infix+"bis"
            case "3s":
                return stem+infix+"bit"
            case "1p":
                return stem+infix+"bimus"
            case "2p":
                return stem+infix+"bitis"
            case "3p":
                return stem+infix+"bunt"
            default:
                return "not valid input "
            }
        case "2":
            //2nd conjugation
            infix="e"
            switch str {
            case "1s":
                return stem+infix+"bo"
            case "2s":
                return stem+infix+"bis"
            case "3s":
                return stem+infix+"bit"
            case "1p":
                return stem+infix+"bimus"
            case "2p":
                return stem+infix+"bitis"
            case "3p":
                return stem+infix+"bunt"
            default:
                return "not valid input "
            }
        case "3":
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="i"
            }else{
                infix="e"
            }
            switch str {
            case "1s":
                return stem+"am"
            case "2s":
                return stem+"es"
            case "3s":
                return stem+"et"
            case "1p":
                return stem+"emus"
            case "2p":
                return stem+"etis"
            case "3p":
                return stem+"ent"
            default:
                return "not valid input "
            }
        case "4":
            //4th conjugation
            infix="i"
            switch str {
            case "1s":
                return stem+infix+"am"
            case "2s":
                return stem+infix+"es"
            case "3s":
                return stem+infix+"et"
            case "1p":
                return stem+infix+"emus"
            case "2p":
                return stem+infix+"etis"
            case "3p":
                return stem+infix+"ent"
            default:
                return "not valid input "
            }
        default:
            return "not valid input"
        }
    }
    func GetPerfect(str:String)->String{
        let futureStem=future1S.dropLast()
        switch str {
        case "1s":
            return future1S
        case "2s":
            return futureStem + "isti"
        case "3s":
            return futureStem + "it"
        case "1p":
            return futureStem + "imus"
        case "2p":
            return futureStem + "istis"
        case "3p":
            return futureStem + "erunt"
        default:
            return "not valid input "
        }
    }
    func GetPluperfect(str:String)->String{
        let futureStem=future1S.dropLast()
        switch str {
        case "1s":
            return futureStem + "ero"
        case "2s":
            return futureStem + "eris"
        case "3s":
            return futureStem + "erit"
        case "1p":
            return futureStem + "erimus"
        case "2p":
            return futureStem + "eristis"
        case "3p":
            return futureStem + "erant"
        default:
            return "not valid input "
        }
    }
    func GetSubjunctiveVowel()->String{
        switch conjugation.suffix(1) {
        case "1":
            return "e"
        case "2":
            return "ea"
        case "3":
            if (present1S.suffix(2)=="io"){
                //it is an 3rd io verb
                return"ia"
            }else{
                return "a"
            }
        case"4":
            return "ia"
        default:
            return "cant find conjugation"
        }
    }
    func GetSubjunctivePresent(str:String)->String{
        let subjuntiveVowel:String = GetSubjunctiveVowel()
        let StemWithVowel=stem+subjuntiveVowel
        switch str{
        case"1s":
            return StemWithVowel + "m"
        case"2s":
            return StemWithVowel + "s"
        case"3s":
            return StemWithVowel + "t"
        case"1p":
            return StemWithVowel + "mus"
        case"2p":
            return StemWithVowel + "tis"
        case"3p":
            return StemWithVowel + "nt"
        default:
            return "can't find person/number"
        }
    }
    func GetSubjunctiveImperfect(str:String)->String{
        switch str {
        case "1s":
            return infinitive+"m"
        case "2s":
            return infinitive+"s"
        case "3s":
            return infinitive+"t"
        case "1p":
            return infinitive+"mus"
        case "2p":
            return infinitive+"tis"
        case "3p":
            return infinitive+"nt"
        default:
            return "cant find person/number"
        }
    }
    func GetSubjunctivePerfect(str:String)->String{
        let futureStem=future1S.dropLast()
        switch str {
        case "1s":
            return  futureStem+"eri"+"m"
        case "2s":
            return futureStem+"eri"+"s"
        case "3s":
            return futureStem+"eri"+"t"
        case "1p":
            return futureStem+"eri"+"mus"
        case "2p":
            return futureStem+"eri"+"tis"
        case "3p":
            return futureStem+"eri"+"m"
        default:
            return "cant find person/number"
        }
    }
    func GetSubjunctivePluperfect(str:String) -> String {
        let futureStem=future1S.dropLast()
        switch str {
        case "1s":
            return  futureStem+"isse"+"m"
        case "2s":
            return futureStem+"isse"+"s"
        case "3s":
            return futureStem+"isse"+"t"
        case "1p":
            return futureStem+"isse"+"mus"
        case "2p":
            return futureStem+"isse"+"tis"
        case "3p":
            return futureStem+"isse"+"m"
        default:
            return "cant find person/number"
        }
    }
    func GetPassiveIndicitivePresent(str:String) -> String{
        var infix:String
        switch conjugation.suffix(1) {
        case "1":
            //1st conjugation
            infix="a"
            switch str {
            case "1s":
                return stem+"or"
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
                return "not valid input "
            }
        case "2":
            //2nd conjugation
            infix="e"
            switch str {
            case "1s":
                return stem+infix+"or"
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
                return "not valid input "
            }
        case "3":
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix = "i"
                switch str {
                case "1s":
                    return stem + infix + "or"
                case "2s":
                    return stem+infix+"ris"
                case "3s":
                    return stem+infix+"tur"
                case "1p":
                    return stem+infix+"mur"
                case "2p":
                    return stem+infix+"mini"
                case "3p":
                    return stem+infix+"untur"
                default:
                    return "not valid input "
                }
            }else{
                infix = "e"
                switch str {
                case "1s":
                    return stem + "or"
                case "2s":
                    return stem+infix+"ris"
                case "3s":
                    return stem+"i"+"tur"
                case "1p":
                    return stem+"i"+"mur"
                case "2p":
                    return stem+"i"+"mini"
                case "3p":
                    return stem+"untur"
                default:
                    return "not valid input "
                }
            }
        case "4":
            //4th conjugation
            infix="i"
            switch str {
            case "1s":
                return stem+infix+"or"
            case "2s":
                return stem+infix+"ris"
            case "3s":
                return stem+infix+"tur"
            case "1p":
                return stem+infix+"mur"
            case "2p":
                return stem+infix+"mini"
            case "3p":
                return stem+infix+"untur"
            default:
                return "not valid input "
            }
        default:
            return "not valid input"
        }
    }
    func GetPassiveIndicitiveImperfect(str:String)-> String{
        var infix:String
        switch conjugation.suffix(1) {
        case "1":
            //1st conjugation
            infix="a"
            switch str {
            case "1s":
                return stem+infix+"bar"
            case "2s":
                return stem+infix+"baris"
            case "3s":
                return stem+infix+"batur"
            case "1p":
                return stem+infix+"bamur"
            case "2p":
                return stem+infix+"batmini"
            case "3p":
                return stem+infix+"bantur"
            default:
                return "not valid input "
            }
        case "2":
            //2nd conjugation
            infix="e"
            switch str {
            case "1s":
                return stem+infix+"bar"
            case "2s":
                return stem+infix+"baris"
            case "3s":
                return stem+infix+"batur"
            case "1p":
                return stem+infix+"bamur"
            case "2p":
                return stem+infix+"batmini"
            case "3p":
                return stem+infix+"bantur"
            default:
                return "not valid input "
            }
        case "3":
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="ie"
            }else{
                infix="e"
            }
            switch str {
            case "1s":
                return stem+infix+"bar"
            case "2s":
                return stem+infix+"baris"
            case "3s":
                return stem+infix+"batur"
            case "1p":
                return stem+infix+"bamur"
            case "2p":
                return stem+infix+"bamini"
            case "3p":
                return stem+infix+"bantur"
            default:
                return "not valid input "
            }
        case "4":
            //4th conjugation
            infix="ie"
            switch str {
            case "1s":
                return stem+infix+"bar"
            case "2s":
                return stem+infix+"baris"
            case "3s":
                return stem+infix+"batur"
            case "1p":
                return stem+infix+"bamur"
            case "2p":
                return stem+infix+"bamini"
            case "3p":
                return stem+"i"+"bantur"
            default:
                return "not valid input "
            }
        default:
            return "not valid input"
        }
    }
    func GetPassiveIndicitiveFuture(str:String)-> String{
        var infix:String
        switch conjugation.suffix(1) {
        case "1":
            //1st conjugation
            infix="a"
            switch str {
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
                return "not valid input "
            }
        case "2":
            //2nd conjugation
            infix="e"
            switch str {
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
                return "not valid input "
            }
        case "3":
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="i"
            }else{
                infix="e"
            }
            switch str {
            case "1s":
                return stem+"ar"
            case "2s":
                return stem+"eris"
            case "3s":
                return stem+"etur"
            case "1p":
                return stem+"emur"
            case "2p":
                return stem+"emini"
            case "3p":
                return stem+"entur"
            default:
                return "not valid input "
            }
        case "4":
            //4th conjugation
            infix="i"
            switch str {
            case "1s":
                return stem+infix+"ar"
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
                return "not valid input "
            }
        default:
            return "not valid input"
        }
        
    }
    func GetPassiveIndicitivePerfect(str:String,gender:String)-> String{
        if perfectParticipal.count==0{
            return "not needed"
        }
        var suffix:String
        switch gender.lowercased(){
        case "m":
            if conjugation.contains("p"){
                suffix="i"
            }else{
                suffix = "us"
            }
        case "f":
            if conjugation.contains("p"){
                suffix="ae"
            }else{
                suffix = "a"
            }
        case "n":
            if conjugation.contains("p"){
                suffix="a"
            }else{
                suffix = "um"
            }
        default:
            suffix = "us"
        }
        let adjectiveForm:String = perfectParticipal.dropLast(2)+suffix
        switch str{
        case "1s":
            return adjectiveForm+" sum"
        case "2s":
            return adjectiveForm+" es"
        case "3s":
            return adjectiveForm+" est"
        case "1p":
            return adjectiveForm+" summus"
        case "2p":
            return adjectiveForm+" estsis"
        case "3p":
            return adjectiveForm+" sunt"
        default:
            return "cannot find person/number"
        }
    }
    func GetPassiveIndicitivePluperfect(str:String,gender:String)-> String{
        if perfectParticipal.count==0{
            return "not needed"
        }
        var suffix:String
        switch gender.lowercased(){
        case "m":
            if conjugation.contains("p"){
                suffix="i"
            }else{
                suffix = "us"
            }
        case "f":
            if conjugation.contains("p"){
                suffix="ae"
            }else{
                suffix = "a"
            }
        case "n":
            if conjugation.contains("p"){
                suffix="a"
            }else{
                suffix = "um"
            }
        default:
            suffix = "us"
        }
        let adjectiveForm:String = perfectParticipal.dropLast(2)+suffix
        switch str{
        case "1s":
            return adjectiveForm+" eram"
        case "2s":
            return adjectiveForm+" eras"
        case "3s":
            return adjectiveForm+" erat"
        case "1p":
            return adjectiveForm+" eramus"
        case "2p":
            return adjectiveForm+" eratis"
        case "3p":
            return adjectiveForm+" erant"
        default:
            return "cannot find person/number"
        }
    }
    func GetPassiveSubjunctivePerfect(str:String,gender:String)-> String{
        if perfectParticipal.count==0{
            return "not needed"
        }
        var suffix:String
        switch gender.lowercased(){
        case "m":
            if conjugation.contains("p"){
                suffix="i"
            }else{
                suffix = "us"
            }
        case "f":
            if conjugation.contains("p"){
                suffix="ae"
            }else{
                suffix = "a"
            }
        case "n":
            if conjugation.contains("p"){
                suffix="a"
            }else{
                suffix = "um"
            }
        default:
            suffix = "us"
        }
        let adjectiveForm:String = perfectParticipal.dropLast(2)+suffix
        switch str{
        case "1s":
            return adjectiveForm+" sim"
        case "2s":
            return adjectiveForm+" sis"
        case "3s":
            return adjectiveForm+" sit"
        case "1p":
            return adjectiveForm+" simus"
        case "2p":
            return adjectiveForm+" sitis"
        case "3p":
            return adjectiveForm+" sint"
        default:
            return "cannot find person/number"
        }
    }
    func GetPassiveSubjunctivePluperfect(str:String,gender:String)-> String{
        if perfectParticipal.count==0{
            return "not needed"
        }
        var suffix:String
        switch gender.lowercased(){
        case "m":
            if conjugation.contains("p"){
                suffix="i"
            }else{
                suffix = "us"
            }
        case "f":
            if conjugation.contains("p"){
                suffix="ae"
            }else{
                suffix = "a"
            }
        case "n":
            if conjugation.contains("p"){
                suffix="a"
            }else{
                suffix = "um"
            }
        default:
            suffix = "us"
        }
        let adjectiveForm:String = perfectParticipal.dropLast(2)+suffix
        switch str{
        case "1s":
            return adjectiveForm+" essem"
        case "2s":
            return adjectiveForm+" esses"
        case "3s":
            return adjectiveForm+" esset"
        case "1p":
            return adjectiveForm+" essemus"
        case "2p":
            return adjectiveForm+" essetis"
        case "3p":
            return adjectiveForm+" essent"
        default:
            return "cannot find person/number"
        }
    }
    func GetPassiveSubjunctivePresent(str:String)->String{
        let subjuntiveVowel:String = GetSubjunctiveVowel()
        let StemWithVowel=stem+subjuntiveVowel
        switch str{
        case"1s":
            return StemWithVowel + "r"
        case"2s":
            return StemWithVowel + "ris"
        case"3s":
            return StemWithVowel + "tur"
        case"1p":
            return StemWithVowel + "mur"
        case"2p":
            return StemWithVowel + "mini"
        case"3p":
            return StemWithVowel + "ntur"
        default:
            return "can't find person/number"
        }
    }
    func GetPassiveSubjunctiveImperfect(str:String)->String{
        switch str {
        case "1s":
            return infinitive+"r"
        case "2s":
            return infinitive+"ris"
        case "3s":
            return infinitive+"tur"
        case "1p":
            return infinitive+"mur"
        case "2p":
            return infinitive+"mini"
        case "3p":
            return infinitive+"ntur"
        default:
            return "cant find person/number"
        }
    }
}
