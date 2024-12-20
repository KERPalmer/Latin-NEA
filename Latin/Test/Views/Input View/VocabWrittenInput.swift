//
//  VocabWrittenInput.swift
//  Latin
//
//  Created by Kenan Palmer on 16/01/2021.
//

import SwiftUI

struct VocabWrittenInputView: View {
    @EnvironmentObject var quiz:Quiz
    @State var question: Question

    var body: some View {
        VStack{
            Text("What is the translation of")
            Spacer()
            Text(question.latinString)
            TextField(question.latin.translations[0],text: $question.vocabAnswer)
            Spacer()
            Button("submit"){
                question.formAnswer = question.formString
                question.isCorrect = question.checkAnswer()
                quiz.isAnswered = true
            }
            Spacer()
        }
    }
}

