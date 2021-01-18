//
//  quiz.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
class Quiz{
    public var questions:[Question]=[]
    public var env:Data // need the enviroment class to change the state of the entire program when it finishes the quiz
    private var questionNum:Int = -1
    init(enviroment: Data){
        env = enviroment
        generateNextQuestion()
    }
    func generateNextQuestion(){
        let newQuestion:Question
        let wordType = env.quizSettings.GetRandomWordType()
        //vocabulary and form
        if wordType == WordTypes.Verb{
            let conjugation: VerbConjugation = env.quizSettings.GetRandomConjugation()
            let verb: Verb = env.programData.GetRandomVerb(conjuguation: conjugation)
            // if form is required we have to generate arandom form
            if !env.quizSettings.vocabOnly{
                // creates a random form for the verb
                let mood : Mood = env.quizSettings.GetRandomMood()
                let voice : Voice  = env.quizSettings.GetRandomVoice()
                let tense : Tense = env.quizSettings.GetRandomTense()
                let personNum: PersonNum = env.quizSettings.GetRandomPersonNum()
                let gender: Gender = env.quizSettings.GetRandomGender()
                //put the different parts of the form into a string
                let formList : [String] = [mood.rawValue, voice.rawValue, tense.rawValue, personNum.rawValue,gender.rawValue]
                //create a newQuestion with the random form and random verb
                newQuestion = FormQuestion(latinWord: verb, wordString: verb.present1S ,formList: formList)
            }
            //no form required form required, we will use the 1st principal part
            else{
                if env.quizSettings.multipleChoice{
                    newQuestion = MultiplechoiceQuestion(latinWord: verb, wordString: verb.present1S)
                }else{
                    newQuestion = VocabQuestion(latinWord: verb, wordString: verb.present1S)
                }
            }
            questions.append(newQuestion)
        }
        else {
            //temporary
            let conjugation: VerbConjugation = env.quizSettings.GetRandomConjugation()
            let verb: Verb = env.programData.GetRandomVerb(conjuguation: conjugation)
            // if form is required we have to generate arandom form
            if !env.quizSettings.vocabOnly{
                // creates a random form for the verb
                let mood : Mood = env.quizSettings.GetRandomMood()
                let voice : Voice  = env.quizSettings.GetRandomVoice()
                let tense : Tense = env.quizSettings.GetRandomTense()
                let personNum: PersonNum = env.quizSettings.GetRandomPersonNum()
                let gender: Gender = env.quizSettings.GetRandomGender()
                //put the different parts of the form into a string
                let formList : [String] = [mood.rawValue, voice.rawValue, tense.rawValue, personNum.rawValue,gender.rawValue]
                //create a newQuestion with the random form and random verb
                newQuestion = FormQuestion(latinWord: verb, wordString: verb.present1S ,formList: formList)
            }
            //no form required form required, we will use the 1st principal part
            else{
                if env.quizSettings.multipleChoice{
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
