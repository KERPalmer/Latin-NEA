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
    public var settings:QuizSettings
    @Published public var inQuiz:Bool = false
    @Published public var isAnswered = false
    @Published public var isFinished:Bool = false
    private var questionNum:Int = -1
    
    init(enviroment: Data){
        wordDatabase = enviroment.programData
        settings = enviroment.quizSettings
    }
    func generateNextQuestion(){
        let newQuestion:Question
        let wordType = settings.GetRandomWordType()
        //vocabulary and form
        if wordType == WordTypes.Verb{
            let conjugation: VerbConjugation = settings.GetRandomConjugation()
            let verb: Verb = wordDatabase.GetRandomVerb(conjuguation: conjugation)
            // if form is required we have to generate arandom form
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
                newQuestion = FormQuestion(latinWord: verb, wordString: verb.present1S ,formList: formList)
            }
            //no form required form required, we will use the 1st principal part
            else{
                if settings.multipleChoice{
                    newQuestion = MultiplechoiceQuestion(latinWord: verb, wordString: verb.present1S)
                }else{
                    newQuestion = VocabQuestion(latinWord: verb, wordString: verb.present1S)
                }
            }
            questions.append(newQuestion)
        }
        else {
            //temporary
            let conjugation: VerbConjugation = settings.GetRandomConjugation()
            let verb: Verb = wordDatabase.GetRandomVerb(conjuguation: conjugation)
            // if form is required we have to generate arandom form
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
                newQuestion = FormQuestion(latinWord: verb, wordString: verb.present1S ,formList: formList)
            }
            //no form required form required, we will use the 1st principal part
            else{
                if settings.multipleChoice{
                    newQuestion = MultiplechoiceQuestion(latinWord: verb, wordString: verb.present1S)
                }else{
                    newQuestion = VocabQuestion(latinWord: verb, wordString: verb.present1S)
                }
            }
            questions.append(newQuestion)
        }

        questionNum += 1
    }
    func getQuestion()->Question{
        return questions[questionNum]
    }
}
