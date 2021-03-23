//
//  appEnviroment.swift
//  Latin
//
//  Created by Kenan Palmer on 18/01/2021.
//
//APPENVIROMENT this will be where the data base and other important data will be stored to be used through out the
//program that can be accessed from most of the program, there are 3 class that we can restrict the access a part of
//the program has on the enviroment.

import Foundation
//this will store all the list of objects of the different word types and hold the methods for retriving them and getting a random
class ProgramDatabase:ObservableObject{
    //the lists that store the different words types
    @Published var verbClassList:[Verb]=[]
    @Published var nounClassList:[Noun]=[]
    @Published var prepositionClassList:[Preposition]=[]
    @Published var adjectiveClassList:[Adjective]=[]
    @Published var conjunctionClassList:[Conjunction]=[]
    @Published var adverbClassList:[Adverb]=[]
    //Takes a file and then initalises a object of the appropiate class and appends it to the appropiate list
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
    //print all the verbs mainly used for debugging
    func printVerbs(){
        for verb in self.verbClassList{
            print(verb.present1S)
        }
    }
    //returns all the verbs, mainly used for debugging
    func GetVerbs()->[Verb]{
        var verbs:[Verb]=[]
        for verb in verbClassList{
            print(verb.present1S)
            verbs.append(verb)
        }
        return verbs
    }
    //returns a random verb given a verb conjugation
    func GetRandomVerb(conjuguation:VerbConjugation) -> Verb{
        var correctConjunction : [Verb] = []
        // get all the verbs of the desired conjunction
        for verb in verbClassList{
            if verb.conjugation == conjuguation{
                correctConjunction.append(verb)
            }
        }
        //selcet a random one
        let rand = Int.random(in: 0 ..< correctConjunction.count)
        return correctConjunction[rand]
    }
    //returns a random noun of the given declension
    func GetRandomNoun(Declension:NounDeclension)->Noun{
        var correctDeclension: [Noun] = []
        //get all the nouns of the correct declension
        for noun in nounClassList{
            if noun.declension == Declension{
                correctDeclension.append(noun)
            }
        }
        //select a random noun
        let rand = Int.random(in: 0..<correctDeclension.count)
        return correctDeclension[rand]
    }
    //returns a random adjective given a declension
    func GetRandomAdjective(Declension:AdjectiveDeclension)->Adjective{
        var correctDeclension: [Adjective] = []
        //get all the nouns of the correct declension
        for adjective in adjectiveClassList{
            if adjective.declension == Declension{
                correctDeclension.append(adjective)
            }
        }
        //select a random noun
        let rand = Int.random(in: 0..<correctDeclension.count)
        return correctDeclension[rand]
    }
    //returns a random preposition given a specific followed by case
    func GetRandomPreposition(followedBy:prepositionFollowedBy) -> Preposition{
        var correctFollowing : [Preposition] = []
        //get all the prepositions of the appropiate followings
        for preposition in prepositionClassList{
            if preposition.following == followedBy{
                correctFollowing.append(preposition)
            }
        }
        //select a random preposition
        let rand = Int.random(in: 0..<correctFollowing.count)
        return correctFollowing[rand]
    }
    func GetRandomAdverb()->Adverb{
        let rand = Int.random(in: 0..<adverbClassList.count)
        return adverbClassList[rand]
    }
    func GetRandomConjuction()->Conjunction{
        let rand = Int.random(in: 0..<conjunctionClassList.count)
        return conjunctionClassList[rand]
    }
}
//DATA THIS CLASS HOLDS THE OTHER CLASSES SO THAT IT IS ALL IN ONE PLACE THE IDEA IS TO HOPEFULLY USE THIS TO ALLOW DIFFERENT PARTS OF THE PROGRAM TO ACCESS CERTAIN.
class Data: ObservableObject{ //this class will be accessed by most parts of the program
    @Published var db:SQLiteDatabase? = ConnectDB()
    @Published var programData:ProgramDatabase = ProgramDatabase(file: vocabData)
    @Published var debug:Bool = true
    @Published var isLoggedIn = false
    @Published var profileID: Int32 = -1
    @Published var profileUsername: String = "none set"
    @Published var profilePassword: String = "none set"
    @Published var quizSettings:QuizSettings = QuizSettings()
    init(){
        if debug == true{
            resetTestDatabase(db: db)
            
        }
    }
    //it logs out the current user and returns to the login screen
    func logOut(){
        profileID = -1
        profileUsername = "none set"
        profilePassword = "none set"
        isLoggedIn = false
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
//TEMPLATE OF THE QUIZ SETTINGS. WHEN A QUIZ IS FIRST SET UP THIS WILL BE THE SETTINGS IT GETS
class QuizSettings: ObservableObject{// a template of the quiz settings, these will be the first settings set when you start the program
    @Published public var vocabOnly: Bool = true
    @Published public var multipleChoice: Bool = false
    //WordTypes
    @Published public var verbs:Bool = true
    @Published public var nouns:Bool = true
    @Published public var adjectives:Bool = true
    @Published public var adverbs:Bool = true
    @Published public var prepositions:Bool = true
    @Published public var conjuctions:Bool = true
    
    //verb conjugations
    @Published public var ConjugationOne:Bool = true
    @Published public var ConjugationTwo:Bool = true
    @Published public var ConjugationThree:Bool = true
    @Published public var ConjugationFour:Bool = true
    
    //verb tense
    @Published public var present:Bool = true
    @Published public var imperfect:Bool = true
    @Published public var perfect:Bool = true
    @Published public var pluperfect:Bool = true
    @Published public var future:Bool = true
    @Published public var imperative:Bool = true
    @Published public var infinitive:Bool = true
    
    //verb moods
    @Published private var indicitive:Bool = true
    @Published private var subjunctive:Bool = false
    
    //verb voices
    @Published public var passive = false
    @Published public var active = true
    
    //noun declensions
    @Published public var declensionOne:Bool = true
    @Published public var declensionTwo:Bool = false
    @Published public var declensionThree:Bool = false
    @Published public var declensionFour:Bool = false
    @Published public var declensionFive:Bool = false
    
    //adjective declension
    @Published public var adjectiveTwoOne:Bool = true
    @Published public var adjectiveThree:Bool = false
    //adjective degrees - includes adverbs
    @Published public var adjectivePositive:Bool = true
    @Published public var adjectiveComparative:Bool = false
    @Published public var adjectiveSuperlative:Bool = false
    @Published public var adjectiveAdverb:Bool = false
    init(){
    }
    //returns a random word type
    func GetRandomWordType()->WordTypes{
        let fin = false
        while !fin {
            let number = Int.random(in: 1...6)
            if number == 1 && verbs{
                return WordTypes.Verb
            }else if number == 2 && nouns{
                return WordTypes.Noun
            }else if number == 3 && adjectives{
                return WordTypes.Adjective
            }else if number == 4 && adverbs{
                return WordTypes.Adverb
            }else if number == 5 && prepositions{
                return WordTypes.Preposition
            }else if number == 6 && conjuctions{
                return WordTypes.Conjunction
            }
        }
    }
    //returns a random tense
    func GetRandomTense()->Tense{
        let fin = false
        while !fin {
            let number = Int.random(in: 1...6)
            if number == 1 && present{
                return Tense.Present
            }else if number == 2 && imperfect{
                return Tense.imperfect
            }else if number == 3 && perfect{
                return Tense.perfect
            }else if number == 4 && pluperfect{
                return Tense.pluperfect
            }else if number == 5 && future{
                return Tense.future
            }else if number == 6 && infinitive{
                return Tense.infinitive
            }
        }
    }
    //returns a random PersonNum
    func GetRandomPersonNum()->PersonNum{
        return PersonNum.allCases.randomElement()!
    }
    //returns a random conjugation
    func GetRandomConjugation()->VerbConjugation{
        let fin = false
        while !fin {
            let number = Int.random(in: 1...4)
            if number == 1 && ConjugationOne{
                return VerbConjugation.First
            }else if number == 2 && ConjugationTwo{
                return VerbConjugation.Second
            }else if number == 3 && ConjugationThree{
                return VerbConjugation.Third
            }else if number == 4 && ConjugationFour{
                return VerbConjugation.Fourth
            }
        }
    }
    //returns a random Mood
    func GetRandomMood()-> Mood{
        let fin = false
        while !fin{
            let number = Int.random(in: 1...2)
            if number == 1 && indicitive{
                return Mood.indicative
            }else if number == 2 && subjunctive{
                return Mood.subjunctive
            }
        }
    }
    //returns a random voice
    func GetRandomVoice() -> Voice{
        let fin = false
        while !fin{
            let number = Int.random(in:1...2)
            if number == 1 && active{
                return Voice.active
            }
            else if number == 2 && passive{
                return Voice.passive
            }
        }
    }
    //returns a random gender
    func GetRandomGender()->Gender{
        let fin = false
        while !fin{
            let number = Int.random(in: 1...3)
            if number == 1{
                return Gender.male
            }
            else if number == 2{
                return Gender.female
            }
            else{
                return Gender.neuter
            }
        }
    }
    //returns a random noun declension
    func GetRandomNounDeclension() -> NounDeclension{
        let fin = false
        while !fin{
            let number = Int.random(in: 1...5)
            if number == 1 && declensionOne{
                return NounDeclension.First
            }else if number == 1 && declensionOne{
                return NounDeclension.First
            }else if number == 2 && declensionTwo{
                return NounDeclension.Second
            }else if number == 3 && declensionThree{
                return NounDeclension.Third
            }else if number == 4 && declensionFour{
                return NounDeclension.Fourth
            }else if number == 5 && declensionFive{
                return NounDeclension.Fifth
            }
            else{
                return NounDeclension.First
            }
        }
    }
    //return random casenum
    func GetRandomCaseNum() -> caseNum{
        return caseNum.allCases.randomElement() ?? caseNum.NomSingular
    }
    //return random adjective declension
    func GetRandomAdjectiveDeclension() -> AdjectiveDeclension{
        let fin = false
        while !fin{
            let number = Int.random(in: 1...2)
            if number == 1 && adjectiveTwoOne{
                return AdjectiveDeclension.TwoOneTwo
            }
            else if number == 2 && adjectiveThree{
                return AdjectiveDeclension.third
            }
            else{
                return AdjectiveDeclension.TwoOneTwo
            }
        }
    }
    //returns random adjective degree
    func GetRandomDegree()->AdjectiveDegree{
        let fin = false
        while !fin{
            let number = Int.random(in: 1...4)
            if number == 1 && adjectivePositive{
                return AdjectiveDegree.positive
            }else if number == 2 && adjectiveComparative{
                return AdjectiveDegree.comparative
            }else if  number == 3 && adjectiveSuperlative{
                return AdjectiveDegree.superlatative
            }else if number == 4 && adjectiveAdverb{
                return AdjectiveDegree.adverb
            }else{
                return AdjectiveDegree.positive
            }
        }
    }
}
//LOAD THE CSV FILE FROM GCSE LATIN
let CSVstring: String = readDataFromFile(file: "GCSE latin")
//TURN THE CSV INTO A LIST WHERE EACH ROW IS A WORD 
let vocabData:[String] = CSVstring.components(separatedBy: "\n")

