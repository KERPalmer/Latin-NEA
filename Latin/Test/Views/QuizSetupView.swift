//
//  TestSetupView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct QuizSetupView: View {
    @EnvironmentObject var quiz: Quiz
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: SettingsView()){
                    Text("settings")
                        .bold()
                }
                Button("Start Quiz"){
                    quiz.generateNextQuestion()
                    quiz.inQuiz=true
                }
            }
        }
    }
}
