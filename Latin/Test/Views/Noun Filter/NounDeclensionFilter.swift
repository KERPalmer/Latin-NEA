//
//  NounDeclensionFilter.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct NounDeclensionFilter: View {
    @Binding var quiz:Quiz
    var body: some View {
        List(){
            Toggle(isOn:$quiz.env.quizSettings.declensionOne){
                Text("First Declension")
            }
            Toggle(isOn:$quiz.env.quizSettings.declensionTwo){
                Text("Second Declension")
            }
            Toggle(isOn:$quiz.env.quizSettings.declensionThree){
                Text("Thrid Declension")
            }
            Toggle(isOn:$quiz.env.quizSettings.declensionFour){
                Text("Fourth Declension")
            }
            Toggle(isOn:$quiz.env.quizSettings.declensionFive){
                Text("Fifth Declension")
            }
        }
    }
}
