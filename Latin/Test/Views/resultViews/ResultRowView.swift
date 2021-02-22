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
        HStack{
            Text(question.latinString)
                .padding(0)
            Spacer()
            if question.isCorrect == false{
                Text(question.vocabAnswer)
            }
            Text(question.latin.get_translation())
                .padding(0)
        }
        .padding(0)
        .background(question.GetColor())
    }
}
