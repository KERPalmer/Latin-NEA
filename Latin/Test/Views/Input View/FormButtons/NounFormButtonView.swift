//
//  NounFormButtonView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct NounFormButtonView: View {
    @EnvironmentObject var quiz:Quiz
    @Binding var partNum: Int
    var body: some View {
        switch partNum{
        case 0:
            VStack{
                HStack{
                    Button("Nom") {
                        appendFormAnswer(part: "nom")
                        partNum+=1
                    }
                    Button("Voc"){
                        appendFormAnswer(part: "voc")
                        partNum+=1
                    }
                    Button("Acc"){
                        appendFormAnswer(part: "acc")
                        partNum+=1
                    }
                }
                HStack{
                    Button("Gen"){
                        appendFormAnswer(part: "gen")
                        partNum+=1
                    }
                }
                    Button("Dat"){
                        appendFormAnswer(part: "dat")
                        partNum+=1
                }
                    Button("Abl"){
                        appendFormAnswer(part: "abl")
                        partNum+=1
                }
            }
        case 1:
            HStack{
                Button("single") {
                    appendFormAnswer(part: "_s,,,,")
                    partNum+=1
                }
                Button("plural"){
                    appendFormAnswer(part: "_p,,,,")
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

