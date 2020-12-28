//
//  TestView.swift
//  Latin
//
//  Created by Kenan Palmer on 27/12/2020.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var env:Data
    @State var quiz: Quiz
    var body: some View {
        if !env.inQuiz{
            QuizSetupView(quiz: $quiz)
        }
        else{
            QuestionView(quiz: $quiz)
        }
    }
}
