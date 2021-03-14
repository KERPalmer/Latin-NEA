//
//  Deponent.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//
//VERB - DOING WORDS - THIS CLASS HOLDS ALL THE MANY METHODS FOR GETTING THE DIFFERENT FORMS OF THE WORDS
class Verb:Word,Codable{
    // using the pricipal parts we should in theory be able to derive any tense, person or voice
    public let present1S:String // this is for ease of access, you could just use the function
    public let infinitive:String
    public let future1S:String
    public let perfectParticipal:String
    public var conjugation:VerbConjugation
    public var stem:String
    override init(line:String, id_:Int){
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
            var conjugationString = format(str:seperated[2])
            //removing the deponent part so we get the right verb conjugation
            if conjugationString.contains("deponent"){
                conjugationString.removeLast(9)
            }
            conjugation = VerbConjugation(rawValue: conjugationString)!
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
            var splitTypeAndTrans = seperated[2].split(separator: ",", omittingEmptySubsequences: true).map { String($0) }
            //remove the deponent part its already part of the right subclass
            if splitTypeAndTrans[0].contains("deponent"){
                splitTypeAndTrans[0].removeLast(9)
            }
            conjugation = VerbConjugation(rawValue: format(str:splitTypeAndTrans[0]))!
        }
        else{
            // prevents crashing
            present1S=""
            infinitive=""
            future1S=""
            perfectParticipal="null"
            conjugation = VerbConjugation.First
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
    override func GetForm(formString:[String])->String{
        //form string should be in the form of mood, voice, tense, personNum, gender
        if formString[0] == Mood.indicative.rawValue{
            if formString[1] == Voice.active.rawValue{
                if formString[2] == Tense.Present.rawValue{
                    return GetPresent(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.imperfect.rawValue{
                    return GetImperfect(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.perfect.rawValue{
                    return GetPerfect(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.pluperfect.rawValue{
                    return GetPluperfect(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.future.rawValue{
                    return GetFuture(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.infinitive.rawValue{
                    return infinitive
                }
                else {
                    return "ERROR INVALID TENSE"
                }
            }
            else if formString[1] == Voice.passive.rawValue{
                    if formString[2] == Tense.Present.rawValue{
                        return GetPassiveIndicitivePresent(personNum: PersonNum.init(rawValue: formString[3])!)
                    }
                    else if formString[2] == Tense.imperfect.rawValue{
                        return GetPassiveIndicitiveImperfect(personNum: PersonNum.init(rawValue: formString[3])!)
                    }
                    else if formString[2] == Tense.perfect.rawValue{
                        return GetPassiveIndicitivePerfect(personNum: PersonNum.init(rawValue: formString[3])!, gender: formString[4])
                    }
                    else if formString[2] == Tense.pluperfect.rawValue{
                        return GetPassiveIndicitivePluperfect(personNum: PersonNum.init(rawValue: formString[3])!, gender: formString[4])
                    }
                    else if formString[2] == Tense.future.rawValue{
                        return GetPassiveIndicitiveFuture(personNum: PersonNum.init(rawValue: formString[3])!)
                    }
                    else if formString[2] == Tense.infinitive.rawValue{
                        //TODO ADD PASSIVE INFINITIVES
                        return infinitive
                    }
                    else{
                        return "ERROR INVALID TENSE"
                    }
                }
            else{
                return "ERROR INVALID VOICE"
            }
        }
        else if formString[0] == Mood.subjunctive.rawValue{
            if formString[1] == Voice.active.rawValue{
                if formString[2] == Tense.Present.rawValue{
                    return GetSubjunctivePresent(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.imperfect.rawValue{
                    return GetSubjunctiveImperfect(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.perfect.rawValue{
                    return GetSubjunctivePerfect(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.pluperfect.rawValue{
                    return GetSubjunctivePluperfect(personNum: PersonNum.init(rawValue: formString[3])!)
                }
                else if formString[2] == Tense.infinitive.rawValue{
                    //TODO INFINITIVE SUBJUNCTIVES
                    return infinitive
                }
                else{
                    return "ERROR INVALID VOICE"
                }
            }
            else if formString[1] == Voice.passive.rawValue{
                    if formString[2] == Tense.Present.rawValue{
                        return GetPassiveSubjunctivePresent(personNum: PersonNum.init(rawValue: formString[3])!)
                    }
                    else if formString[2] == Tense.imperfect.rawValue{
                        return GetPassiveSubjunctiveImperfect(personNum: PersonNum.init(rawValue: formString[3])!)
                    }
                    else if formString[2] == Tense.perfect.rawValue{
                        return GetPassiveSubjunctivePerfect(personNum: PersonNum.init(rawValue: formString[3])!, gender: formString[4])
                    }
                    else if formString[2] == Tense.pluperfect.rawValue{
                        return GetPassiveSubjunctivePluperfect(personNum: PersonNum.init(rawValue: formString[3])!, gender: formString[4])
                    }
                    else if formString[2] == Tense.infinitive.rawValue{
                        //TODO ADD PASSIVE INFINITIVES
                        return infinitive
                    }
                    else{
                        return "ERROR INVALID TENSE"
                    }
                }
            else{
                return "ERROR INVALID VOICE"
            }
        }
        else{
            return "ERROR INVALID MOOD"
        }
    }
    func GetImperfect(personNum:PersonNum)->String{
        var infix:String
        switch conjugation {
        case .First:
            //1st conjugation
            infix="a"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bam"
            case .SecondSingular:
                return stem+infix+"bas"
            case .ThirdSingular:
                return stem+infix+"bat"
            case .FirstPlural:
                return stem+infix+"bamus"
            case .SecondPlural:
                return stem+infix+"batis"
            case .ThirdPlural:
                return stem+infix+"bant"
            }
        case .Second:
            //2nd conjugation
            infix="e"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bam"
            case .SecondSingular:
                return stem+infix+"bas"
            case .ThirdSingular:
                return stem+infix+"bat"
            case .FirstPlural:
                return stem+infix+"bamus"
            case .SecondPlural:
                return stem+infix+"batis"
            case .ThirdPlural:
                return stem+infix+"bant"
            }
        case .Third:
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="ie"
            }else{
                infix="e"
            }
            switch personNum{
            case .FirstSingular:
                return stem+infix+"bam"
            case .SecondSingular:
                return stem+infix+"bas"
            case .ThirdSingular:
                return stem+infix+"bat"
            case .FirstPlural:
                return stem+infix+"bamus"
            case .SecondPlural:
                return stem+infix+"batis"
            case .ThirdPlural:
                return stem+infix+"bant"
            }
        case .Fourth:
            //4th conjugation
            infix="ie"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bam"
            case .SecondSingular:
                return stem+infix+"bas"
            case .ThirdSingular:
                return stem+infix+"bat"
            case .FirstPlural:
                return stem+infix+"bamus"
            case .SecondPlural:
                return stem+infix+"batis"
            case .ThirdPlural:
                return stem+"i"+"bant"
            }
        default:
            return "not valid input"
        }
    }
    func GetPresent(personNum:PersonNum)->String{
        var infix:String
        switch conjugation {
        case .First:
            //1st conjugation
            infix="a"
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return stem+infix+"s"
            case .ThirdSingular:
                return stem+infix+"t"
            case .FirstPlural:
                return stem+infix+"mus"
            case .SecondPlural:
                return stem+infix+"tis"
            case .ThirdPlural:
                return stem+infix+"nt"
            }
        case .Second:
            //2nd conjugation
            infix="e"
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return stem+infix+"s"
            case .ThirdSingular:
                return stem+infix+"t"
            case .FirstPlural:
                return stem+infix+"mus"
            case .SecondPlural:
                return stem+infix+"tis"
            case .ThirdPlural:
                return stem+infix+"nt"
            }
        case .Third:
            //3rd conjugation
            infix="i"
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return stem+infix+"s"
            case .ThirdSingular:
                return stem+infix+"t"
            case .FirstPlural:
                return stem+infix+"mus"
            case .SecondPlural:
                return stem+infix+"tis"
            case .ThirdPlural:
                if String(present1S.suffix(2))=="io"{
                    return stem+"iu"+"nt"
                }else{
                    return stem+"u"+"nt"
                }
            }
        case .Fourth:
            //4th conjugation
            infix="i"
            switch personNum {
            case .FirstSingular:
                return present1S
            case .SecondSingular:
                return stem+infix+"s"
            case .ThirdSingular:
                return stem+infix+"t"
            case .FirstPlural:
                return stem+infix+"mus"
            case .SecondPlural:
                return stem+infix+"tis"
            case .ThirdPlural:
                return stem+infix+"nt"
            }
        default:
            return "not valid input"
        }
    }
    func GetFuture(personNum:PersonNum)->String{
        var infix:String
        switch conjugation {
        case .First:
            //1st conjugation
            infix="a"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bo"
            case .SecondSingular:
                return stem+infix+"bis"
            case .ThirdSingular:
                return stem+infix+"bit"
            case .FirstPlural:
                return stem+infix+"bimus"
            case .SecondPlural:
                return stem+infix+"bitis"
            case .ThirdPlural:
                return stem+infix+"bunt"
            }
        case .Second:
            //2nd conjugation
            infix="e"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bo"
            case .SecondSingular:
                return stem+infix+"bis"
            case .ThirdSingular:
                return stem+infix+"bit"
            case .FirstPlural:
                return stem+infix+"bimus"
            case .SecondPlural:
                return stem+infix+"bitis"
            case .ThirdPlural:
                return stem+infix+"bunt"
            }
        case .Third:
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="i"
            }else{
                infix=""
            }
            switch personNum {
            case .FirstSingular:
                return stem+"am"
            case .SecondSingular:
                return stem+"es"
            case .ThirdSingular:
                return stem+"et"
            case .FirstPlural:
                return stem+"emus"
            case .SecondPlural:
                return stem+"etis"
            case .ThirdPlural:
                return stem+"ent"
            }
        case .Fourth:
            //4th conjugation
            infix="i"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"am"
            case .SecondSingular:
                return stem+infix+"es"
            case .ThirdSingular:
                return stem+infix+"et"
            case .FirstPlural:
                return stem+infix+"emus"
            case .SecondPlural:
                return stem+infix+"etis"
            case .ThirdPlural:
                return stem+infix+"ent"
            }
        default:
            return "not valid input"
        }
    }
    func GetPerfect(personNum:PersonNum)->String{
        let futureStem=future1S.dropLast()
        switch personNum {
        case .FirstSingular:
            return future1S
        case .SecondSingular:
            return futureStem + "isti"
        case .ThirdSingular:
            return futureStem + "it"
        case .FirstPlural:
            return futureStem + "imus"
        case .SecondPlural:
            return futureStem + "istis"
        case .ThirdPlural:
            return futureStem + "erunt"
        }
    }
    func GetPluperfect(personNum:PersonNum)->String{
        let futureStem=future1S.dropLast()
        switch personNum {
        case .FirstSingular:
            return futureStem + "ero"
        case .SecondSingular:
            return futureStem + "eris"
        case .ThirdSingular:
            return futureStem + "erit"
        case .FirstPlural:
            return futureStem + "erimus"
        case .SecondPlural:
            return futureStem + "eristis"
        case .ThirdPlural:
            return futureStem + "erant"
        }
    }
    func GetSubjunctiveVowel()->String{
        switch conjugation {
        case .First:
            return "e"
        case .Second:
            return "ea"
        case .Third:
            if (present1S.suffix(2)=="io"){
                //it is an 3rd io verb
                return"ia"
            }else{
                return "a"
            }
        case.Fourth:
            return "ia"
        default:
            return "cant find conjugation"
        }
    }
    func GetSubjunctivePresent(personNum:PersonNum)->String{
        let subjuntiveVowel:String = GetSubjunctiveVowel()
        let StemWithVowel=stem+subjuntiveVowel
        switch personNum{
        case .FirstSingular:
            return StemWithVowel + "m"
        case .SecondSingular:
            return StemWithVowel + "s"
        case .ThirdSingular:
            return StemWithVowel + "t"
        case .FirstPlural:
            return StemWithVowel + "mus"
        case .SecondPlural:
            return StemWithVowel + "tis"
        case .ThirdPlural:
            return StemWithVowel + "nt"
        }
    }
    func GetSubjunctiveImperfect(personNum:PersonNum)->String{
        switch personNum{
        case .FirstSingular:
            return infinitive+"m"
        case .SecondSingular:
            return infinitive+"s"
        case .ThirdSingular:
            return infinitive+"t"
        case .FirstPlural:
            return infinitive+"mus"
        case .SecondPlural:
            return infinitive+"tis"
        case .ThirdPlural:
            return infinitive+"nt"
        }
    }
    func GetSubjunctivePerfect(personNum:PersonNum)->String{
        let futureStem=future1S.dropLast()
        switch personNum {
        case .FirstSingular:
            return  futureStem+"eri"+"m"
        case .SecondSingular:
            return futureStem+"eri"+"s"
        case .ThirdSingular:
            return futureStem+"eri"+"t"
        case .FirstPlural:
            return futureStem+"eri"+"mus"
        case .SecondPlural:
            return futureStem+"eri"+"tis"
        case .ThirdPlural:
            return futureStem+"eri"+"m"
        }
    }
    func GetSubjunctivePluperfect(personNum:PersonNum) -> String {
        let futureStem=future1S.dropLast()
        switch personNum {
        case .FirstSingular:
            return  futureStem+"isse"+"m"
        case .SecondSingular:
            return futureStem+"isse"+"s"
        case .ThirdSingular:
            return futureStem+"isse"+"t"
        case .FirstPlural:
            return futureStem+"isse"+"mus"
        case .SecondPlural:
            return futureStem+"isse"+"tis"
        case .ThirdPlural:
            return futureStem+"isse"+"m"
        }
    }
    func GetPassiveIndicitivePresent(personNum:PersonNum) -> String{
        var infix:String
        switch conjugation {
        case .First:
            //1st conjugation
            infix="a"
            switch personNum {
            case .FirstSingular:
                return stem+"or"
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
                return stem+infix+"or"
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
            if present1S.suffix(2)=="io"{
                infix = "i"
                switch personNum {
                case .FirstSingular:
                    return stem + infix + "or"
                case .SecondSingular:
                    return stem+infix+"ris"
                case .ThirdSingular:
                    return stem+infix+"tur"
                case .FirstPlural:
                    return stem+infix+"mur"
                case .SecondPlural:
                    return stem+infix+"mini"
                case .ThirdPlural:
                    return stem+infix+"untur"
                }
            }else{
                infix = "e"
                switch personNum {
                case .FirstSingular:
                    return stem + "or"
                case .SecondSingular:
                    return stem+infix+"ris"
                case .ThirdSingular:
                    return stem+"i"+"tur"
                case .FirstPlural:
                    return stem+"i"+"mur"
                case .SecondPlural:
                    return stem+"i"+"mini"
                case .ThirdPlural:
                    return stem+"untur"
                }
            }
        case .Fourth:
            //4th conjugation
            infix="i"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"or"
            case .SecondSingular:
                return stem+infix+"ris"
            case .ThirdSingular:
                return stem+infix+"tur"
            case .FirstPlural:
                return stem+infix+"mur"
            case .SecondPlural:
                return stem+infix+"mini"
            case .ThirdPlural:
                return stem+infix+"untur"
            }
        default:
            return "not valid input"
        }
    }
    func GetPassiveIndicitiveImperfect(personNum:PersonNum)-> String{
        var infix:String
        switch conjugation {
        case .First:
            //1st conjugation
            infix="a"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bar"
            case .SecondSingular:
                return stem+infix+"baris"
            case .ThirdSingular:
                return stem+infix+"batur"
            case .FirstPlural:
                return stem+infix+"bamur"
            case .SecondPlural:
                return stem+infix+"batmini"
            case .ThirdPlural:
                return stem+infix+"bantur"
            }
        case .Second:
            //2nd conjugation
            infix="e"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bar"
            case .SecondSingular:
                return stem+infix+"baris"
            case .ThirdSingular:
                return stem+infix+"batur"
            case .FirstPlural:
                return stem+infix+"bamur"
            case .SecondPlural:
                return stem+infix+"batmini"
            case .ThirdPlural:
                return stem+infix+"bantur"
            }
        case .Third:
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="ie"
            }else{
                infix="e"
            }
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bar"
            case .SecondSingular:
                return stem+infix+"baris"
            case .ThirdSingular:
                return stem+infix+"batur"
            case .FirstPlural:
                return stem+infix+"bamur"
            case .SecondPlural:
                return stem+infix+"bamini"
            case .ThirdPlural:
                return stem+infix+"bantur"
            }
        case .Fourth:
            //4th conjugation
            infix="ie"
            switch personNum {
            case .FirstSingular:
                return stem+infix+"bar"
            case .SecondSingular:
                return stem+infix+"baris"
            case .ThirdSingular:
                return stem+infix+"batur"
            case .FirstPlural:
                return stem+infix+"bamur"
            case .SecondPlural:
                return stem+infix+"bamini"
            case .ThirdPlural:
                return stem+"i"+"bantur"
            }
        default:
            return "not valid input"
        }
    }
    func GetPassiveIndicitiveFuture(personNum:PersonNum)-> String{
        var infix:String
        switch conjugation {
        case .First:
            //1st conjugation
            infix="a"
            switch personNum{
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
            switch personNum{
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
        case .Third:
            //3rd conjugation
            if present1S.suffix(2)=="io"{
                infix="i"
            }else{
                infix="e"
            }
            switch personNum{
            case .FirstSingular:
                return stem+"ar"
            case .SecondSingular:
                return stem+"eris"
            case .ThirdSingular:
                return stem+"etur"
            case .FirstPlural:
                return stem+"emur"
            case .SecondPlural:
                return stem+"emini"
            case .ThirdPlural:
                return stem+"entur"
            }
        case .Fourth:
            //4th conjugation
            infix="i"
            switch personNum{
            case .FirstSingular:
                return stem+infix+"ar"
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
        default:
            return "not valid input"
        }
        
    }
    func GetPassiveIndicitivePerfect(personNum:PersonNum,gender:String)-> String{
        if perfectParticipal.count==0{
            return "not needed"
        }
        var suffix:String
        switch gender.lowercased(){
        case "m":
            // contains p so needs plural ending
            if personNum.rawValue.contains("p"){
                suffix="i"
            }else{
                suffix = "us"
            }
        case "f":
            if personNum.rawValue.contains("p"){
                suffix="ae"
            }else{
                suffix = "a"
            }
        case "n":
            if personNum.rawValue.contains("p"){
                suffix="a"
            }else{
                suffix = "um"
            }
        default:
            suffix = "us"
        }
        let adjectiveForm:String = perfectParticipal.dropLast(2)+suffix
        switch personNum{
        case .FirstSingular:
            return adjectiveForm+" sum"
        case .SecondSingular:
            return adjectiveForm+" es"
        case .ThirdSingular:
            return adjectiveForm+" est"
        case .FirstPlural:
            return adjectiveForm+" summus"
        case .SecondPlural:
            return adjectiveForm+" estsis"
        case .ThirdPlural:
            return adjectiveForm+" sunt"
        }
    }
    func GetPassiveIndicitivePluperfect(personNum:PersonNum,gender:String)-> String{
        if perfectParticipal.count==0{
            return "not needed"
        }
        var suffix:String
        switch gender.lowercased(){
        case "m":
            // contains p so needs plural ending
            if personNum.rawValue.contains("p"){
                suffix="i"
            }else{
                suffix = "us"
            }
        case "f":
            if personNum.rawValue.contains("p"){
                suffix="ae"
            }else{
                suffix = "a"
            }
        case "n":
            if personNum.rawValue.contains("p"){
                suffix="a"
            }else{
                suffix = "um"
            }
        default:
            suffix = "us"
        }
        let adjectiveForm:String = perfectParticipal.dropLast(2)+suffix
        switch personNum{
        case .FirstSingular:
            return adjectiveForm+" eram"
        case .SecondSingular:
            return adjectiveForm+" eras"
        case .ThirdSingular:
            return adjectiveForm+" erat"
        case .FirstPlural:
            return adjectiveForm+" eramus"
        case .SecondPlural:
            return adjectiveForm+" eratis"
        case .ThirdPlural:
            return adjectiveForm+" erant"
        }
    }
    func GetPassiveSubjunctivePerfect(personNum: PersonNum,gender:String)-> String{
        if perfectParticipal.count==0{
            return "not needed"
        }
        var suffix:String
        switch gender.lowercased(){
        case "m":
            // contains p is plural so plural ending
            if personNum.rawValue.contains("p"){
                suffix="i"
            }else{
                suffix = "us"
            }
        case "f":
            if personNum.rawValue.contains("p"){
                suffix="ae"
            }else{
                suffix = "a"
            }
        case "n":
            if personNum.rawValue.contains("p"){
                suffix="a"
            }else{
                suffix = "um"
            }
        default:
            suffix = "us"
        }
        let adjectiveForm:String = perfectParticipal.dropLast(2)+suffix
        switch personNum{
        case .FirstSingular:
            return adjectiveForm+" sim"
        case .SecondSingular:
            return adjectiveForm+" sis"
        case .ThirdSingular:
            return adjectiveForm+" sit"
        case .FirstPlural:
            return adjectiveForm+" simus"
        case .SecondPlural:
            return adjectiveForm+" sitis"
        case .ThirdPlural:
            return adjectiveForm+" sint"
        }
    }
    func GetPassiveSubjunctivePluperfect(personNum:PersonNum,gender:String)-> String{
        if perfectParticipal.count==0{
            return "not needed"
        }
        var suffix:String
        switch gender.lowercased(){
        case "m":
            if personNum.rawValue.contains("p"){
                suffix="i"
            }else{
                suffix = "us"
            }
        case "f":
            if personNum.rawValue.contains("p"){
                suffix="ae"
            }else{
                suffix = "a"
            }
        case "n":
            if personNum.rawValue.contains("p"){
                suffix="a"
            }else{
                suffix = "um"
            }
        default:
            suffix = "us"
        }
        let adjectiveForm:String = perfectParticipal.dropLast(2)+suffix
        switch personNum{
        case .FirstSingular:
            return adjectiveForm+" essem"
        case .SecondSingular:
            return adjectiveForm+" esses"
        case .ThirdSingular:
            return adjectiveForm+" esset"
        case .FirstPlural:
            return adjectiveForm+" essemus"
        case .SecondPlural:
            return adjectiveForm+" essetis"
        case .ThirdPlural:
            return adjectiveForm+" essent"
        }
    }
    func GetPassiveSubjunctivePresent(personNum: PersonNum)->String{
        let subjuntiveVowel:String = GetSubjunctiveVowel()
        let StemWithVowel=stem+subjuntiveVowel
        switch personNum{
        case .FirstSingular:
            return StemWithVowel + "r"
        case .SecondSingular:
            return StemWithVowel + "ris"
        case .ThirdSingular:
            return StemWithVowel + "tur"
        case .FirstPlural:
            return StemWithVowel + "mur"
        case .SecondPlural:
            return StemWithVowel + "mini"
        case .ThirdPlural:
            return StemWithVowel + "ntur"
        }
    }
    func GetPassiveSubjunctiveImperfect(personNum:PersonNum)->String{
        switch personNum{
        case .FirstSingular:
            return infinitive+"r"
        case .SecondSingular:
            return infinitive+"ris"
        case .ThirdSingular:
            return infinitive+"tur"
        case .FirstPlural:
            return infinitive+"mur"
        case .SecondPlural:
            return infinitive+"mini"
        case .ThirdPlural:
            return infinitive+"ntur"
        }
    }
    override func GetFeedback(formAnswer:String,incorrectForm:String)->[String]{
        let formAnswerList = incorrectForm.split(separator: ",").map{ String($0) }
        let formList = formAnswer.split(separator: ",").map{ String($0) }
        var feedback:[String] = []
        if formAnswerList[0] != formList[0]{
            switch Mood.init(rawValue: formList[0])! {
                case .indicative:
                    feedback.append("The verb was in the Indicitive form, you said it was in the subjective form")
                case.subjunctive:
                    feedback.append("The verb was in the subjunctive form, you said it was in the indicitive form" )
            }
        }
        if formAnswerList[1] != formList[1]{
        switch Voice.init(rawValue: formList[1])!{
            case .active:
                feedback.append("the verb was in the active form, you gave it in the passive")
            case .passive:
                feedback.append("the verb was in the passive form you gave it in the active ")
            }
        }
        if formAnswerList[2] != formList[2]{
            var feedbackPart:String = ""
            switch Tense.init(rawValue: formList[2])! {
            case .Present:
                feedbackPart.append("The verb was in the present tense")
            case .imperfect:
                feedbackPart.append("The verb was in the imperfect tense")
            case .perfect:
                feedbackPart.append("the verb was in the perfect tense")
            case .pluperfect:
                feedbackPart.append("The verb was in the pluperfect tense")
            case .future:
                feedbackPart.append("The verb was in the future tense")
            case .infinitive:
                feedbackPart.append("The verb was in the infinitive tense")
            }
            switch Tense.init(rawValue: formAnswerList[2])! {
            case .Present:
                feedbackPart.append("you gave it in the present tense")
            case .imperfect:
                feedbackPart.append("you gave it in the imperfect tense")
            case .perfect:
                feedbackPart.append("you gave it in the perfect tense")
            case .pluperfect:
                feedbackPart.append("you gave it in the pluperfect tense")
            case .future:
                feedbackPart.append("you gave it in the future tense")
            case .infinitive:
                feedbackPart.append("you gave it in in the infinitive tense")
            }
            feedback.append(feedbackPart)
        }
        if formAnswerList[3] != formList[3]{
            var feedbackPart:String = ""
            switch PersonNum.init(rawValue: formList[3])! {
            case .FirstSingular:
                feedbackPart.append("The verb was in the first singular form")
            
            case .SecondSingular:
                feedbackPart.append("The verb was in the second singular form")
            case .ThirdSingular:
                feedbackPart.append("The verb was in the third singular form")
            case .FirstPlural:
                feedbackPart.append("The verb was in the first plural form")
            case .SecondPlural:
                feedbackPart.append("The verb was in the second plural form")
            case .ThirdPlural:
                feedbackPart.append("The verb was in the third plural form")
            }
            switch PersonNum.init(rawValue: formAnswerList[3])! {
            case .FirstSingular:
                feedbackPart.append("you gave it in the first singular form")
            case .SecondSingular:
                feedbackPart.append("you gave it in the second singular form")
            case .ThirdSingular:
                feedbackPart.append("you gave it in the third singular form")
            case .FirstPlural:
                feedbackPart.append("you gave it in the first plural form")
            case .SecondPlural:
                feedbackPart.append("you gave it in the second plural form")
            case .ThirdPlural:
                feedbackPart.append("you gave it in the third plural form")
            }
            feedback.append(feedbackPart)
        }
        
        return feedback
    }
    enum Context: String, CaseIterable, Encodable {
        case indicitve = "The Indicitve mood is used to represent facts or truths such something did occur or will occur"
        case subjunctive = "The Subjunctive modd is used torepresent many things, such as intent, consequence."
        case active = "The Active voice is used to show that the action is performed on the object of the sentence by the subject: Bob hit Jim is an example"
        case passive = "The passive voice is used to show that the action is performed on the subject of the sentence by the object: Jim was hit by bob"
        case present = "The present tense is used to show that a verb is happening now, at this very moment: Bob hits Jim"
        case imperfect = "The imperfect tense is used to show an incompleted action or an action that happened once: Bob was hitting Jim."
        case perfect = "The perfect tense is used to show a completed action or an action that occurs more than once: Bob hit Jim"
        case pluperfect = "The pluperfect tense is used to show the past's past, we would use 'had' to show it: Bob had hit Jim"
        case future = "The future tense is used to to show an action that will occur in the future: Bob will hit Jim"
        case FirstPerson = "The first person realtes to yourself: me myself or i"
        case inifinitve = "The infinitive tense is used to show action in a timeless sence, it is the abstract action and is translated and to ... : I eat apples, I need to leave"
        case SecondPerson = "The second person relates to the person or people you are addressing, you, you all"
        case ThirdPerson = "The third perosn relates to a person or some people you aren't addressing: him, her, it, them"
        case singular = "there is only one of the person thing or object"
        case plural = "there is multiple of the perosn thing or object"
    }
    
}
