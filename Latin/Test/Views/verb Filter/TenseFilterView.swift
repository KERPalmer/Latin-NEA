//
//  TenseFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct TenseFilterView: View {
    @Binding var quiz:Quiz
    var body: some View {
        List(){
            Toggle(isOn:$quiz.env.quizSettings.infinitive){
                Text("Infinitive ")
            }
            Toggle(isOn:$quiz.env.quizSettings.present){
                Text("Present Tense")
            }
            Toggle(isOn:$quiz.env.quizSettings.imperfect){
                Text("Imperfect Tense")
            }
            Toggle(isOn:$quiz.env.quizSettings.perfect){
                Text("Perfect Tense")
            }
            Toggle(isOn:$quiz.env.quizSettings.pluperfect){
                Text("Pluperfect Tense")
            }
            Toggle(isOn:$quiz.env.quizSettings.future){
                Text("Future Tense")
            }
            Toggle(isOn:$quiz.env.quizSettings.imperative){
                Text("imperative Tense")
            }
        }
    }
}
