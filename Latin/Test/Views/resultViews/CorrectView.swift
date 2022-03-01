//
//  SwiftUIView.swift
//  Latin
//
//  Created by Kenan Palmer on 28/12/2020.
//

import SwiftUI

struct CorrectView: View {
    @EnvironmentObject var quiz:Quiz
    var question: Question
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.green)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text(question.latinString)
                Spacer()
                Text(question.latin.get_all_translations())
                Spacer()
                if !quiz.settings.vocabOnly{
                    Text(question.formString)
                }
                if !quiz.isFinished{
                Button("next question"){
                    quiz.generateNextQuestion()
                    quiz.isAnswered = false
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
                Spacer()
            }
        }
    }
}

