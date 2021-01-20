//
//  VocabWrittenInput.swift
//  Latin
//
//  Created by Kenan Palmer on 16/01/2021.
//

import SwiftUI

struct VocabWrittenInputView: View {
    @EnvironmentObject var quiz:Quiz
    @State var question: VocabQuestion

    var body: some View {
        VStack{
            Text("What is the translation of")
            Spacer()
            Text(question.latinString)
            TextField(question.latin.translations[0],text: $question.answer)
            Spacer()
            Button("submit"){
                question.isCorrect = question.checkAnswer()
                quiz.isAnswered = true
            }
        }
    }
}

