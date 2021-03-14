//
//  InputView.swift
//  Latin
//
//  Created by Kenan Palmer on 28/12/2020.
//

import SwiftUI

struct FormInputView: View {
    @State var question:Question
    @EnvironmentObject var quiz:Quiz
    
    
    var body: some View {
        VStack{
            Text("What is the translation of")
            Spacer()
            Text(question.latinString)
            Text("vocab:")
            TextField(question.translations[0],text: $question.vocabAnswer)
            Text(question.formString)
            Spacer()
            FormButtonView()
            Spacer()
        }
    }
}
