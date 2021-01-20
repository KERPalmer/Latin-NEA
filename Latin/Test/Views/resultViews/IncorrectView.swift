//
//  IncorrectView.swift
//  Latin
//
//  Created by Kenan Palmer on 28/12/2020.
//

import SwiftUI

struct IncorrectView: View {
    @EnvironmentObject var quiz:Quiz
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.red)
                .ignoresSafeArea()
            VStack{
                Spacer()
                Text(quiz.getQuestion().latinString)
                Spacer()
                Text(quiz.getQuestion().latin.get_all_translations())
                Text("you said")
                Text(quiz.getQuestion().answer)
                Spacer()
                Button("next question"){
                    quiz.generateNextQuestion()
                    quiz.isAnswered = false
                    quiz.getQuestion().isCorrect = false
                }
                Spacer()
                Button("Finsh Test"){
                    quiz.inQuiz = false
                    quiz.isAnswered = false
                    quiz.isFinished = true
                }
            }
        }
    }
}
