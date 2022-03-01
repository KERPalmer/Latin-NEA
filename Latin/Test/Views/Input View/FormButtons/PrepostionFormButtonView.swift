//
//  PrepostionFormButtonView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct PrepostionFormButtonView: View {
    @EnvironmentObject var quiz:Quiz
    @Binding var partNum: Int
    var body: some View {
        switch partNum{
        case 0:
            HStack{
                Button("+ ablative"){
                    appendFormAnswer(part: "ablative,,,,")
                    partNum+=1
                }
                Button("+ accusative"){
                    appendFormAnswer(part: "accusative,,,,")
                    partNum+=1
                }
            }
        default:
            Button("submit"){
                quiz.getQuestion().isCorrect = quiz.getQuestion().checkAnswer()
                quiz.isAnswered = true
            }
        }
    }
    func appendFormAnswer(part:String){
        let updatedAnswer = quiz.getQuestion().formAnswer + part
        quiz.getQuestion().formAnswer = updatedAnswer
    }
}
