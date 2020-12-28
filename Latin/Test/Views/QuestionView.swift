//
//  QuestionView.swift
//  Latin
//
//  Created by Kenan Palmer on 27/12/2020.
//

import SwiftUI

struct QuestionView: View {
    @Binding var quiz:Quiz
    @State var answer: String = ""
    @State var isCorrect = false
    @State var isAnswered = false
    var body: some View {
        VStack{
            Text("What is the translation of")
            Text(quiz.getQuestion().latin)
            TextField("Enter answer here",text: $answer)
            Button("submit"){
                isAnswered = true
                if quiz.getQuestion().vocabTranslations.contains(answer.lowercased()){
                    isCorrect = true
                }
            }
        }
    }
}
