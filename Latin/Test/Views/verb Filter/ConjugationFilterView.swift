//
//  ConjugationFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct ConjugationFilterView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        List(){
            Toggle(isOn:$env.quizSettings.ConjugationOne){
                Text("First Conjugation Verbs")
            }
            Toggle(isOn:$env.quizSettings.ConjugationTwo){
                Text("Second Conjugation Verbs")
            }
            Toggle(isOn:$env.quizSettings.ConjugationThree){
                Text("Third Conjugation Verbs")
            }
            Toggle(isOn:$env.quizSettings.ConjugationFour){
                Text("Fourth Conjugation Verbs")
            }
        }
    }
}
