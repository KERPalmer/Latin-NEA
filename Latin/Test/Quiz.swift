//
//  quiz.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import Foundation
class Quiz{
    public var questions:[Question]=[]
    public var settings:QuizSettings
    private var questionNum:Int = -1
    init(Quizsettings:QuizSettings){
        settings = Quizsettings
        generateNextQuestion(settings: settings)
    }
    func generateNextQuestion(settings:QuizSettings){
        let wordType : WordTypes = settings.GetRandomWordType()
        questions.append(Question())
        questionNum += 1
    }
    func getQuestion()->Question{
        return questions[questionNum]
    }
}
