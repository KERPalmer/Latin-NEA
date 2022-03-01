//
//  ConjugationFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct ConjugationFilterView: View {
    @EnvironmentObject var quiz:Quiz
    var body: some View {
        List(){
            Toggle(isOn:$quiz.settings.ConjugationOne){
                Text("First Conjugation Verbs")
            }
            Toggle(isOn:$quiz.settings.ConjugationTwo){
                Text("Second Conjugation Verbs")
            }
            Toggle(isOn:$quiz.settings.ConjugationThree){
                Text("Third Conjugation Verbs")
            }
            Toggle(isOn:$quiz.settings.ConjugationFour){
                Text("Fourth Conjugation Verbs")
            }
        }
    }
}
