//
//  AdjectiveDegreeFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 23/03/2021.
//

import SwiftUI

struct AdjectiveDegreeFilterView: View {
    @EnvironmentObject var quiz:Quiz
    var body: some View {
        Toggle(isOn: $quiz.settings.adjectivePositive){
            Text("positive degree")
        }
        Toggle(isOn: $quiz.settings.adjectiveComparative){
            Text("comparative degree")
        }
        Toggle(isOn: $quiz.settings.adjectiveSuperlative){
            Text("comparative degree")
        }
        Toggle(isOn: $quiz.settings.adjectiveAdverb){
            Text("adverb degree")
        }
    }
}
