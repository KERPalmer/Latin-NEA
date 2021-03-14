//
//  QuizFinishView.swift
//  Latin
//
//  Created by Kenan Palmer on 19/01/2021.
//

import SwiftUI
//this view will show all the questions attempted in a quiz
struct QuizFinishView: View {
    @EnvironmentObject var quiz:Quiz
    var body: some View {
        NavigationView{
            VStack{
                Text("YOU FINISHED")
                List(quiz.questions){ question in
                    ResultRowView(question: question)
                }
                Button("Done"){
                    quiz.inQuiz = false
                    quiz.isAnswered = false
                    quiz.isFinished = false
                }
            }
        }.background(Color.white)
        
    }
}
