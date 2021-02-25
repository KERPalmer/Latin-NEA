//
//  quiz.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
//QUIZ - THIS CLASS CONTROLS ALL THE ACTIONS THAT HAPPEN WITH THE QUIZ PART OF THE PROGRAM.IT CREATES QUESTION OBJECTS AND COMMUNICATES WITH THE SQLDATABASE CLASS TO STORE THEM ALL
class Quiz: ObservableObject{
    public var questions:[Question]=[]
    //gonna create a copy of the enviroments word database and quiz settings. these wil be used in the quiz setup and to control the flow of the quiz part of the program.
    public var wordDatabase:ProgramDatabase
    public var SQLdatabase:SQLiteDatabase
    public var settings:QuizSettings
    public var storeResults: Bool // this is to distinquish between a real test and practise test
    public var profileID: Int32// used to be stored in the confidence table
    @Published public var inQuiz:Bool = false
    @Published public var isAnswered = false
    @Published public var isFinished:Bool = false
    private var questionNum:Int = -1
    
    init(enviroment: Data, storeResults_:Bool ){
        storeResults = storeResults_
        wordDatabase = enviroment.programData
        SQLdatabase = enviroment.db!
        profileID = enviroment.profileID
        settings = enviroment.quizSettings
    }
    func generateNextQuestion(){
        var newQuestion:Question
        let wordType = settings.GetRandomWordType()
        var formList:[String]
        
        
        
        //verb
        if wordType == WordTypes.Verb{
            let conjugation: VerbConjugation = settings.GetRandomConjugation()
            let verb: Verb = wordDatabase.GetRandomVerb(conjuguation: conjugation)
            
            // if form is required we have to generate a random form
            if !settings.vocabOnly{
                print("creating random form and form question")
                // creates a random form for the verb
                let mood : Mood = settings.GetRandomMood()
                let voice : Voice  = settings.GetRandomVoice()
                let tense : Tense = settings.GetRandomTense()
                let personNum: PersonNum = settings.GetRandomPersonNum()
                let gender: Gender = settings.GetRandomGender()
                //put the different parts of the form into a string if its infinitive or doesnt need a gender there are gaps
                if tense == Tense.infinitive{
                    formList = [mood.rawValue, voice.rawValue, tense.rawValue,"",""]
                }else if voice == Voice.passive && (tense == Tense.perfect || tense == Tense.pluperfect) {
                    formList = [mood.rawValue,voice.rawValue,tense.rawValue,personNum.rawValue,gender.rawValue]
                }else{
                    formList = [mood.rawValue,voice.rawValue,tense.rawValue,personNum.rawValue,""]
                }
                formList.append(verb.conjugation.rawValue)
                //create a newQuestion with the random form and random verb
                newQuestion = Question(latinWord: verb, form: formList, db: SQLdatabase)
            }
            //no form required form required, we will use the 1st principal part this will be used 
            else{
                if settings.multipleChoice{
                    print("creating multiple choice question")
                    newQuestion = MultiplechoiceQuestion(latinWord: verb, form: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue,"",conjugation.rawValue], db: SQLdatabase)
                }else{
                    print("creating vocab Question")
                    newQuestion = Question(latinWord: verb, form: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue,"",conjugation.rawValue], db: SQLdatabase)
                }
            }
        }
        //NOUNS
        else if wordType == WordTypes.Noun{
            let casenum:caseNum
            let declension = settings.GetRandomNounDeclension()
            let noun:Noun = wordDatabase.GetRandomNoun(Declension: declension)
            if settings.vocabOnly{ //generate random form
                casenum = caseNum.NomSingular
            }else{
                casenum = settings.GetRandomCaseNum()
            }
            let formList = [casenum.rawValue,"","","","",declension.rawValue]
            //multiple choice question
            if settings.multipleChoice{
                newQuestion = MultiplechoiceQuestion(latinWord: noun, form: formList, db: SQLdatabase)
            }
            //written question
            else{
                newQuestion = Question(latinWord: noun, form: formList, db: SQLdatabase)
            }
        }
        //ADJECTIVES
        
        else if wordType == WordTypes.Adjective{
            let declension = settings.GetRandomAdjectiveDeclension()
            let adjective = wordDatabase.GetRandomAdjective(Declension: declension)
            let formList:[String]
            if !settings.vocabOnly{
                let degree: AdjectiveDegree = settings.GetRandomDegree()
                let casenum: caseNum = settings.GetRandomCaseNum()
                let gender: Gender = settings.GetRandomGender()
                formList = [degree.rawValue, casenum.rawValue, gender.rawValue,"","",adjective.declension.rawValue]
            }else{
                formList = [AdjectiveDegree.positive.rawValue,caseNum.NomSingular.rawValue,Gender.male.rawValue,"","",adjective.declension.rawValue]
            }
            if settings.multipleChoice{
                newQuestion = MultiplechoiceQuestion(latinWord: adjective, form: formList, db: SQLdatabase)
            }
            //written question
            else{
                newQuestion = Question(latinWord: adjective, form: formList, db: SQLdatabase)
            }
        }
        
        //PREPOSITIONS
        else if wordType == WordTypes.Preposition{
            let followedBy = prepositionFollowedBy.allCases.randomElement()
            let preposition = wordDatabase.GetRandomPreposition(followedBy: followedBy!)
            let formList = [followedBy!.rawValue, "","","","",WordTypes.Preposition.rawValue]
            if settings.multipleChoice{
                newQuestion = MultiplechoiceQuestion(latinWord: preposition, form: formList, db: SQLdatabase)
            }
            //written question
            else{
                newQuestion = Question(latinWord: preposition, form: formList, db: SQLdatabase)
            }
        }
        //INDECLINABLES - ADVERBS AND CONJUNCTIONS
        else {
            let formList = ["indeclinable","","","","",wordType.rawValue]
            let word:Word
            if wordType == WordTypes.Adverb{
                word = wordDatabase.GetRandomAdverb()
            }else if wordType == WordTypes.Conjunction{
                word = wordDatabase.GetRandomConjuction()
            }else{
                word = wordDatabase.GetRandomConjuction()
            }
            if settings.multipleChoice{
                newQuestion = MultiplechoiceQuestion(latinWord: word, form: formList, db: SQLdatabase)
            }
            //written question
            else{
                newQuestion = Question(latinWord: word, form: formList, db: SQLdatabase)
            }
        }
        questions.append(newQuestion)
        questionNum += 1
    }
    func getQuestion()->Question{
        return questions[questionNum]
    }
    //THIS IS WHERE IT COMMUNICATES WITH THE SQLDATABASE
    func saveAttempts(SQLdb:SQLiteDatabase,profileID: Int32){
        for question in questions{
            let row_id:Int32 = SQLdb.checkConfidence(result: question, profileID: profileID, insertSQL: Confidence.GetRowIDQueryStatement)
            if row_id != 0{
                //there is such a row so we update it....
                do{
                    try SQLdb.UpdateConfidence(row_id: row_id,result: question)
                }catch{
                    print("failed to update \(question.vocabAnswer)")
                }
            }else{ // no such row so we insert
                do{
                    try SQLdb.insertConfidence(result: question, profileID:profileID , insertSQL: Confidence.insertStatement)
                }catch{
                    print("failed to save \(question.vocabAnswer)")
                    print(SQLdatabase.GetErrorMessage())
                }
            }
        }
    }
}
