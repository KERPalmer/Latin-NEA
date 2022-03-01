//
//  ResultRowView.swift
//  Latin
//
//  Created by Kenan Palmer on 20/01/2021.
//

import SwiftUI

struct ResultRowView: View {
    var question: Question
    var body: some View {
        if question.isCorrect{
            NavigationLink(destination: CorrectView(question: question)){
                HStack{
                    Text(question.latinString)
                        .padding()
                    Spacer()
                    Text(question.latin.get_translation())
                }
            }.background(question.GetColor())
            .ignoresSafeArea()
        }
        else{
            NavigationLink(destination: IncorrectView(question: question)){
                HStack{
                    Text(question.latinString)
                        .padding()
                    Spacer()
                    Text(question.vocabAnswer)
                    Spacer()
                    Text(question.latin.get_translation())
                }
                .background(question.GetColor())
                .ignoresSafeArea()
            }
        }
    }
}
