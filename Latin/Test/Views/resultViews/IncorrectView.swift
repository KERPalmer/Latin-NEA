//
//  IncorrectView.swift
//  Latin
//
//  Created by Kenan Palmer on 28/12/2020.
//

import SwiftUI

struct IncorrectView: View {
    @EnvironmentObject var quiz:Quiz
    var question :Question
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.red)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text(question.latinString)
                Spacer()
                Text(question.latin.get_all_translations())
                Text("you said")
                Text(question.vocabAnswer)
                Spacer()
                if !quiz.settings.vocabOnly{
                    VStack{
                        Text("The correct form was:")
                        Text(question.formString)
                        Text("You said:")
                        Text(question.formAnswer)
                        Text(question.GetFeedBack())
                    }
                }
                if !quiz.isFinished{
                    Button("next question"){
                        quiz.generateNextQuestion()
                        quiz.isAnswered = false
                        question.isCorrect = false
                        }
                    Spacer()
                    Button("Finsh Test"){
                        if quiz.storeResults{
                            quiz.saveAttempts(SQLdb: quiz.SQLdatabase, profileID: quiz.profileID)
                        }
                        quiz.inQuiz = false
                        quiz.isAnswered = false
                        quiz.isFinished = true
                    }
                }
            }
        }
    }
}
