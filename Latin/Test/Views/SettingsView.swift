//
//  SettingsView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var quiz:Quiz
    var body: some View {
        List{
            VStack{
                Toggle(isOn: $quiz.settings.vocabOnly){
                    Text("vocabulary only")
                }
                Toggle(isOn: $quiz.settings.multipleChoice){
                    Text("multiple choice")
                }
            }
            VStack{
                Text("word type filter")
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
                Text("word Filters")
                    .bold()
                NavigationLink(destination: ConjugationFilterView()){
                    Text("Verb Conjugation Filter")
                }
                NavigationLink(destination: TenseFilterView()){
                    Text("Verb Tense Filter")
                }
                NavigationLink(destination: NounDeclensionFilter()){
                    Text("Noun Declension Filter")
                }
                NavigationLink(destination: AdjectiveDeclensionFilterView()){
                    Text("Adjective Declension Filter")
                }
                NavigationLink(destination: AdjectiveDegreeFilterView()){
                    Text("Adjective Degree filter")
                }
            }.frame(height: 300)
        }
    }
}
