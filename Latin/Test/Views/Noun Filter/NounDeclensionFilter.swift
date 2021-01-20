//
//  NounDeclensionFilter.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct NounDeclensionFilter: View {
    @EnvironmentObject   var quiz:Quiz
    var body: some View {
        List(){
            Toggle(isOn:$quiz.settings.declensionOne){
                Text("First Declension")
            }
            Toggle(isOn:$quiz.settings.declensionTwo){
                Text("Second Declension")
            }
            Toggle(isOn:$quiz.settings.declensionThree){
                Text("Thrid Declension")
            }
            Toggle(isOn:$quiz.settings.declensionFour){
                Text("Fourth Declension")
            }
            Toggle(isOn:$quiz.settings.declensionFive){
                Text("Fifth Declension")
            }
        }
    }
}
