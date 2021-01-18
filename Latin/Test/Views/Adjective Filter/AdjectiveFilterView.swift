//
//  AdjectiveFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct AdjectiveDeclensionFilterView: View {
    @Binding var quiz : Quiz
    var body: some View {
        List(){
            Toggle(isOn:$quiz.env.quizSettings.adjectiveTwoOne){
                Text("First and Second Declension Adjectives")
            }
            Toggle(isOn:$quiz.env.quizSettings.adjectiveThree){
                Text("First and Second Declension Adjectives")
            }
            
        }
    }
}
