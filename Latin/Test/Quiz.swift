//
//  quiz.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
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
        let formList:[String]
        //vocabulary and form
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
                //create a newQuestion with the random form and random verb
                newQuestion = Question(latinWord: verb, form: formList, db: SQLdatabase)
            }
            //no form required form required, we will use the 1st principal part this will be used 
            else{
                if settings.multipleChoice{
                    print("creating multiple choice question")
                    newQuestion = MultiplechoiceQuestion(latinWord: verb, form: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue," ",conjugation.rawValue], db: SQLdatabase)
                }else{
                    print("creating vocab Question")
                    newQuestion = Question(latinWord: verb, form: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue," ",conjugation.rawValue], db: SQLdatabase)
                }
            }
            questions.append(newQuestion)
        }
        else {
            //temporary
            let conjugation: VerbConjugation = settings.GetRandomConjugation()
            let verb: Verb = wordDatabase.GetRandomVerb(conjuguation: conjugation)
            
            // if form is required we have to generate a random form
            if !settings.vocabOnly{
                // creates a random form for the verb
                let mood : Mood = settings.GetRandomMood()
                let voice : Voice  = settings.GetRandomVoice()
                let tense : Tense = settings.GetRandomTense()
                let personNum: PersonNum = settings.GetRandomPersonNum()
                let gender: Gender = settings.GetRandomGender()
                //put the different parts of the form into a string
                let formList : [String] = [mood.rawValue, voice.rawValue, tense.rawValue, personNum.rawValue,gender.rawValue]
                //create a newQuestion with the random form and random verb
                newQuestion = Question(latinWord: verb, form: formList, db: SQLdatabase)
            }
            //no form required form required, we will use the 1st principal part
            else{
                if settings.multipleChoice{
                    newQuestion = MultiplechoiceQuestion(latinWord: verb, form: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue," ",conjugation.rawValue], db: SQLdatabase)
                }else{
                    newQuestion = VocabQuestion(latinWord: verb, form: [Mood.indicative.rawValue,Voice.active.rawValue,Tense.Present.rawValue,PersonNum.FirstSingular.rawValue," ",conjugation.rawValue], db: SQLdatabase)
                }
            }
            questions.append(newQuestion)
        }

        questionNum += 1
    }
    func getQuestion()->Question{
        return questions[questionNum]
    }
    func saveAttempts(SQLdb:SQLiteDatabase,profileID: Int32){
        for question in questions{
            if SQLdb.checkConfidence(result: question, profileID: profileID, insertSQL: Confidence.GetRowIDQueryStatement) == true{
                //there is such a row so we update it....
                
            }else{
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
