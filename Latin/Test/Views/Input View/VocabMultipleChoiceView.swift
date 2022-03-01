//
//  VocabMultipleChoiceView.swift
//  Latin
//
//  Created by Kenan Palmer on 16/01/2021.
//

import SwiftUI

struct VocabMultipleChoiceView: View {
    @EnvironmentObject var quiz:Quiz
    @State var question: MultiplechoiceQuestion
    @State var randomInt: Int = Int.random(in: 0...10)
    var body: some View {
        VStack{
            Text("What is the translation of")
            Spacer()
            Text(question.latinString)
            Spacer()
            HStack{
                Spacer()
                Button(question.answerSelection[0]){
                    question.vocabAnswer=question.answerSelection[0]
                }
                Spacer()
                Button(question.answerSelection[1]){
                    question.vocabAnswer=question.answerSelection[1]
                }
                Spacer()
            }
            Spacer()
            HStack{
                Spacer()
                Button(question.answerSelection[2]){
                    question.vocabAnswer=question.answerSelection[2]
                }
                Spacer()
                Button(question.answerSelection[3]){
                    question.vocabAnswer=question.answerSelection[3]
                }
                Spacer()
            }
            if !quiz.settings.vocabOnly{
                Spacer()
                Text(question.formString)
                Spacer()
                FormButtonView()
                Spacer()
            }else{
                Spacer()
                Button("submit"){ // submit button if a form isnt required
                    question.formAnswer = question.formString // make the form asnwer the same as the form question
                    question.isCorrect = question.checkAnswer()
                    quiz.isAnswered = true
                }
            }
            Spacer()
        }
    }
}

