//
//  AdverbFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct AdverbFilterView: View {
    @Binding var quiz:Quiz
    var body: some View {
        HStack{
            Toggle(isOn:$quiz.env.quizSettings.adverbs){
                Text("Adverbs")
            }
            Spacer()
        }
    }
}
