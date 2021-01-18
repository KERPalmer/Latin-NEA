//
//  ConjunctionFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct ConjunctionFilterView: View {
    @Binding var quiz: Quiz
    var body: some View {
        HStack{
            Toggle(isOn:$quiz.env.quizSettings.conjuctions){
                Text("Conjunctions")
            }
            Spacer()
        }
    }
}
