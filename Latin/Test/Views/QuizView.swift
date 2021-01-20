//
//  TestView.swift
//  Latin
//
//  Created by Kenan Palmer on 27/12/2020.
//

import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quiz: Quiz
    var body: some View {
        if quiz.inQuiz == false{
            if quiz.isFinished{
                QuizFinishView()
            }else{
                QuizSetupView()
            }
        }
        else{
            QuestionView()
        }
    }
}
