//
//  QuestionView.swift
//  Latin
//
//  Created by Kenan Palmer on 27/12/2020.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quiz:Quiz
    @State var answer: String = ""
    var body: some View {
        //TO MUCH STUFF
        ZStack{
            if quiz.isAnswered{
                if quiz.getQuestion().isCorrect{
                    CorrectView()
                }
                else{
                    IncorrectView()
                }
            }else{
                //
                if quiz.settings.vocabOnly{
                    if quiz.settings.multipleChoice{
                        VocabMultipleChoiceView(question: quiz.getQuestion())
                    }else{
                        VocabWrittenInputView(question: quiz.getQuestion())
                    }
                }else{
                    FormInputView(question: quiz.getQuestion())
                }
            }
        }
    }
}
