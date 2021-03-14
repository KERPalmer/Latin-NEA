//
//  ConjuctionFormButtonBiew.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct ConjunctionFormButtonView: View {
    @EnvironmentObject var quiz:Quiz
    @Binding var partNum: Int
    var body: some View {
        Button("submit"){
            appendFormAnswer(part: "indeclinable,,,,")
            quiz.getQuestion().isCorrect = quiz.getQuestion().checkAnswer()
            quiz.isAnswered = true
        }
    }
    func appendFormAnswer(part:String){
        let updatedAnswer = quiz.getQuestion().formAnswer + part
        quiz.getQuestion().formAnswer = updatedAnswer
    }
}

