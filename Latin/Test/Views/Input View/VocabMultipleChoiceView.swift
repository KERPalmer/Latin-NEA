//
//  VocabMultipleChoiceView.swift
//  Latin
//
//  Created by Kenan Palmer on 16/01/2021.
//

import SwiftUI

struct VocabMultipleChoiceView: View {
    @EnvironmentObject var quiz:Quiz
    @State var question: Question
    var body: some View {
        VStack{
            Text("What is the translation of")
            Spacer()
            Text(question.latinString)
            Spacer()
            HStack{
                Button(question.translations[0]){
                    
                }
            }
            
            Spacer()
            Button("submit"){
                question.isCorrect = question.checkAnswer()
                quiz.isAnswered = true
            }
        }
    }
}

