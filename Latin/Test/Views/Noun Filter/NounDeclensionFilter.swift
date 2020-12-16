//
//  NounDeclensionFilter.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct NounDeclensionFilter: View {
    @EnvironmentObject var env:Data
    var body: some View {
        List(){
            Toggle(isOn:$env.quizSettings.DeclensionOne){
                Text("First Declension")
            }
            Toggle(isOn:$env.quizSettings.DeclensionTwo){
                Text("Second Declension")
            }
            Toggle(isOn:$env.quizSettings.DeclensionThree){
                Text("Thrid Declension")
            }
            Toggle(isOn:$env.quizSettings.DeclensionFour){
                Text("Fourth Declension")
            }
            Toggle(isOn:$env.quizSettings.DeclensionFive){
                Text("Fifth Declension")
            }
        }
    }
}
