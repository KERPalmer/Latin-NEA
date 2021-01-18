//
//  SwiftUIView.swift
//  Latin
//
//  Created by Kenan Palmer on 28/12/2020.
//

import SwiftUI

struct CorrectView: View {
    @Binding var quiz:Quiz
    @Binding var isAnswered:Bool
    @Binding var isCorrect:Bool
    var body: some View {
            VStack{
                Text(quiz.getQuestion().latinString)
                Text(quiz.getQuestion().latin.get_all_translations())
                Button("next question"){
                quiz.generateNextQuestion()
                isAnswered = true
                isCorrect = false
            }
        }
    }
}
