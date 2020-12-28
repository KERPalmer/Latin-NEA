//
//  SettingsView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var env:Data
    @Binding var quiz:Quiz
    var body: some View {
        VStack{
            List{
                Toggle(isOn: $quiz.settings.verbs){
                    Text("Test Verbs")
                }
                Toggle(isOn: $quiz.settings.nouns){
                    Text("Test Nouns")
                }
                Toggle(isOn:$quiz.settings.adjectives){
                    Text("Test Adjectives")
                }
                Toggle(isOn: $quiz.settings.adverbs){
                    Text("Test Adverbs")
                }
                Toggle(isOn: $quiz.settings.prepositions){
                    Text("Test Prepositions")
                }
                Toggle(isOn: $quiz.settings.conjuctions){
                    Text("Test conjunctions")
                }
            }
            List{
                Text("Filters")
                    .bold()
                NavigationLink(destination: ConjugationFilterView(quiz: $quiz)){
                    Text("Verb Conjugation Filter")
                }
                NavigationLink(destination: TenseFilterView(quiz: $quiz)){
                    Text("Verb Tense Filter")
                }
                NavigationLink(destination: NounDeclensionFilter(quiz: $quiz)){
                    Text("Noun Declension Filter")
                }
                NavigationLink(destination: AdjectiveDeclensionFilterView(quiz: $quiz)){
                    Text("Adjective Declension Filter")
                }
            }
        }
    }
}
