//
//  AdjectiveFormButtonView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct AdjectiveFormButtonView: View {
    @EnvironmentObject var quiz:Quiz
    @Binding var partNum: Int
    var body: some View {
        switch partNum{
        case 0:
            VStack{
                HStack{
                    Spacer()
                    Button("positive") {
                        appendFormAnswer(part: "positive,")
                        partNum+=1
                    }
                    Spacer()
                    Button("Compartaive") {
                        appendFormAnswer(part: "comparative,")
                        partNum+=1
                        }
                    Spacer()
                    }
                HStack{
                    Spacer()
                    Button("Adverb") {
                        appendFormAnswer(part: "adverb,,,,")
                        partNum = -1
                    }
                    Spacer()
                    Button("Superlatiavtive") {
                        appendFormAnswer(part: "superlatative,")
                        partNum+=1
                        }
                    Spacer()
                }
                Button("Ideclinable") {
                    appendFormAnswer(part: "indeclinable,,,,")
                    partNum = -1
                }
            }
        case 1:
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
                    Button("Dat"){
                        appendFormAnswer(part: "dat")
                        partNum+=1
                }
                    Button("Abl"){
                        appendFormAnswer(part: "abl")
                        partNum+=1
                }
            }
        }
        case 2:
            HStack{
                Button("single") {
                    appendFormAnswer(part: "_s,")
                    partNum+=1
                }
                Button("plural"){
                    appendFormAnswer(part: "_p,")
                    partNum+=1
                }
            }
        case 3:
            HStack{
                Button("mas") {
                    appendFormAnswer(part: "m,,")
                    partNum+=1
                }
                Button("fem"){
                    appendFormAnswer(part: "f,,")
                    partNum+=1
                }
                Button("neu"){
                    appendFormAnswer(part: "n,,")
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
