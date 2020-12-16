//
//  TenseFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct TenseFilterView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        List(){
            Toggle(isOn:$env.quizSettings.infinitive){
                Text("Infinitive ")
            }
            Toggle(isOn:$env.quizSettings.present){
                Text("Present Tense")
            }
            Toggle(isOn:$env.quizSettings.imperfect){
                Text("Imperfect Tense")
            }
            Toggle(isOn:$env.quizSettings.perfect){
                Text("Perfect Tense")
            }
            Toggle(isOn:$env.quizSettings.pluperfect){
                Text("Pluperfect Tense")
            }
            Toggle(isOn:$env.quizSettings.future){
                Text("Future Tense")
            }
            Toggle(isOn:$env.quizSettings.imperative){
                Text("imperative Tense")
            }
        }
    }
}
