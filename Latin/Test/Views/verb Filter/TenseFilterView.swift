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
            Toggle(isOn:$quiz.settings.infinitive){
                Text("Infinitive ")
            }
            Toggle(isOn:$quiz.settings.present){
                Text("Present Tense")
            }
            Toggle(isOn:$quiz.settings.imperfect){
                Text("Imperfect Tense")
            }
            Toggle(isOn:$quiz.settings.perfect){
                Text("Perfect Tense")
            }
            Toggle(isOn:$quiz.settings.pluperfect){
                Text("Pluperfect Tense")
            }
            Toggle(isOn:$quiz.settings.future){
                Text("Future Tense")
            }
            Toggle(isOn:$quiz.settings.imperative){
                Text("imperative Tense")
            }
        }
    }
}
