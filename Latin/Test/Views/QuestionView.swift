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
        //TO MUCH STUFF
        ZStack{
            if isAnswered{
                if isCorrect{
                    //CorrectView(quiz: quiz, isAnswered: isAnswered, isCorrect: isCorrect)
                }
                else{
                    IncorrectView()
                }
            }else{
                if quiz.env.quizSettings.vocabOnly{
                    if quiz.env.quizSettings.multipleChoice{
                        VocabMultipleChoiceView()
                    }else{
                        VocabWrittenInputView(question: quiz.getQuestion() as! VocabQuestion, isCorrect: $isCorrect, isAnswered: $isAnswered)
                    }
                }else{
                    FormInputView(question: quiz.getQuestion()  as! FormQuestion, isCorrect: $isCorrect, isAnswered: $isAnswered)
                }
            }
        }
    }
}
