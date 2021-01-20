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
            Text(question.answer)
        }.background(question.GetColor())
    }
}
