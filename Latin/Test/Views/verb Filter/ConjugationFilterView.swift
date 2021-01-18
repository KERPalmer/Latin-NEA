//
//  ConjugationFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct ConjugationFilterView: View {
    @Binding var quiz:Quiz
    var body: some View {
        List(){
            Toggle(isOn:$quiz.env.quizSettings.ConjugationOne){
                Text("First Conjugation Verbs")
            }
            Toggle(isOn:$quiz.env.quizSettings.ConjugationTwo){
                Text("Second Conjugation Verbs")
            }
            Toggle(isOn:$quiz.env.quizSettings.ConjugationThree){
                Text("Third Conjugation Verbs")
            }
            Toggle(isOn:$quiz.env.quizSettings.ConjugationFour){
                Text("Fourth Conjugation Verbs")
            }
        }
    }
}
