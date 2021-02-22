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
        //case Noun: NounFormButton()
        //case Adjective: AdjectiveFormButton()
        //case Preposition: PrepositionFormButton()
        //case Conjunction: ConjunctionFormButton()
        //case Adverb: AdverbFormButton()
        default: EmptyView()
        }
    }
}

