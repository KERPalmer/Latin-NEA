//
//  SettingsView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        List{
            VStack{
                Toggle(isOn: $env.quizSettings.verbs){
                    Text("Test Verbs")
                }
                Toggle(isOn: $env.quizSettings.nouns){
                    Text("Test Nouns")
                }
                Toggle(isOn:$env.quizSettings.adjectives){
                    Text("Test Adjectives")
                }
                Toggle(isOn: $env.quizSettings.adverbs){
                    Text("Test Adverbs")
                }
                Toggle(isOn: $env.quizSettings.prepositions){
                    Text("Test Prepositions")
                }
                Toggle(isOn: $env.quizSettings.conjuctions){
                    Text("Test conjunctions")
                }
            }
            VStack{
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
            }
            VStack{
                NavigationLink(destination: Text("Verb Filter")){
                    Text("Verb Filter")
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
