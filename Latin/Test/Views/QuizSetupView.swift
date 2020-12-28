//
//  TestSetupView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct QuizSetupView: View {
    @EnvironmentObject var env:Data
    @Binding var quiz: Quiz
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: SettingsView(quiz:$quiz)){
                    Text("settings")
                        .bold()
                }
                Button("Start Quiz"){
                    env.inQuiz=true
                }
            }
        }
    }
}
