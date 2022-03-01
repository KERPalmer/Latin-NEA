//
//  AdjectiveFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct AdjectiveDeclensionFilterView: View {
    @EnvironmentObject var quiz : Quiz
    var body: some View {
        List(){
            Toggle(isOn:$quiz.settings.adjectiveTwoOne){
                Text("First and Second Declension Adjectives")
            }
            Toggle(isOn:$quiz.settings.adjectiveThree){
                Text("Third Declension Adjectives")
            }
            
        }
    }
}
