//
//  FormButtonView.swift
//  Latin
//
//  Created by Kenan Palmer on 21/02/2021.
//

import SwiftUI
//this view will provide the buttons for the different forms, the button will change to the next form
struct FormButtonView: View {
    @EnvironmentObject var quiz: Quiz
    @State var partNum: Int = 0
    var body: some View {
        switch quiz.getQuestion().latin{
        case is Verb: VerbFormButton(partNum: $partNum)
        case is Noun: NounFormButtonView(partNum: $partNum)
        case is Adjective: AdjectiveFormButtonView(partNum: $partNum)
        case is Preposition: PrepostionFormButtonView(partNum: $partNum)
        case is Conjunction: ConjunctionFormButtonView(partNum: $partNum)
        case is Adverb: AdverbFormButtonView(partNum: $partNum)
        default: EmptyView()
        }
    }
}

