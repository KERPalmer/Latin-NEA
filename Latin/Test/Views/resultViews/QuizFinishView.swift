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
        VStack{
        Text("YOU FINISHED")
            List(quiz.questions){ question in
                HStack{
                    Text(question.latinString)
                }
            }
        }
        
    }
}
