//
//  InputView.swift
//  Latin
//
//  Created by Kenan Palmer on 28/12/2020.
//

import SwiftUI

struct FormInputView: View {
    @State var question: FormQuestion
    @Binding var isCorrect:Bool
    @Binding var isAnswered: Bool

    
    var body: some View {
        VStack{
            Text("What is the translation of")
            Spacer()
            Text(question.latinString)
            Text("vocab:")
            TextField(question.translations[0],text: $question.vocabAnswer)
            Spacer()
            Text("form:")
            TextField(question.formString,text: $question.formAnswer)
            Button("submit"){
                isCorrect = question.checkAnswer()
                isAnswered = true
            }
        }
    }
}
