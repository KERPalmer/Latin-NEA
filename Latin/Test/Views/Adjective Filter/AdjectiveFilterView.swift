//
//  AdjectiveFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct AdjectiveDeclensionFilterView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        List(){
            Toggle(isOn:$env.quizSettings.AdjectiveTwoOne){
                Text("First and Second Declension Adjectives")
            }
            Toggle(isOn:$env.quizSettings.AdjectiveThree){
                Text("First and Second Declension Adjectives")
            }
            
        }
    }
}
