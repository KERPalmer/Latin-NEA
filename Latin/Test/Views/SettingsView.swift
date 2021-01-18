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
                Toggle(isOn:$quiz.env.quizSettings.vocabOnly){
                    Text("vocabulary only")
                }
                Toggle(isOn:$quiz.env.quizSettings.multipleChoice){
                    Text("multiple choice")
                }
            }
            List{
                Toggle(isOn: $quiz.env.quizSettings.verbs){
                    Text("Test Verbs")
                }
                Toggle(isOn: $quiz.env.quizSettings.nouns){
                    Text("Test Nouns")
                }
                Toggle(isOn:$quiz.env.quizSettings.adjectives){
                    Text("Test Adjectives")
                }
                Toggle(isOn: $quiz.env.quizSettings.adverbs){
                    Text("Test Adverbs")
                }
                Toggle(isOn: $quiz.env.quizSettings.prepositions){
                    Text("Test Prepositions")
                }
                Toggle(isOn: $quiz.env.quizSettings.conjuctions){
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
