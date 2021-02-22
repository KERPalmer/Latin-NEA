//
//  VerbFormButton.swift
//  Latin
//
//  Created by Kenan Palmer on 21/02/2021.
//
//this will provide the buttons for the verb forms and apend each choice to the form answer of the question
/*
 case Present = "pre"
 case imperfect = "imp"
 case perfect = "per"
 case pluperfect = "plu"
 case future = "fut"
 case infinitive = "inf"
 */
import SwiftUI
//the buttons for the form for verbs each time a button is pressed the selected part will be appened tp the questions form answer and the next button shown
struct VerbFormButton: View {
    @EnvironmentObject var quiz:Quiz
    @Binding var partNum: Int
    @State var isPassive: Bool = false //needed to see if gender needed
    @State var isPerfectPluperfect: Bool = false //needed to see if gender needed
    var body: some View {
        switch partNum{
        case 0:
            HStack{
                Button("indicitive") {
                    appendFormAnswer(part: "ind,")
                    partNum+=1
                }
                Button("subjunctive"){
                    appendFormAnswer(part: "sub,")
                    partNum+=1
                }
            }
        case 1:
            HStack{
                Button("active") {
                    appendFormAnswer(part: "act,")
                    partNum+=1
                }
                Button("passive"){
                    appendFormAnswer(part: "pas,")
                    isPassive = true
                    partNum+=1
                }
            }
        case 2:
            ScrollView(.horizontal){
                HStack{
                    Spacer()
                    Button("present") {
                        appendFormAnswer(part: "pre,")
                        partNum+=1
                    }
                    Button("imperfect") {
                        appendFormAnswer(part: "imp,")
                        partNum+=1
                    }
                    Button("perfect") {
                        appendFormAnswer(part: "per,")
                        isPerfectPluperfect = true
                        partNum+=1
                    }
                    Button("pluperfect") {
                        appendFormAnswer(part: "plu,")
                        isPerfectPluperfect = true
                        partNum+=1
                    }
                    Button("future") {
                        appendFormAnswer(part: "future,")
                        partNum+=1
                    }
                    Button("infinitive") {
                        appendFormAnswer(part: "inf,,")// commas needed to complete full form
                        partNum = -1 // no more forms needed
                    }
                    Spacer()
                }
            }
        case 3:
            HStack{
                Button("first person") {
                    appendFormAnswer(part: "1")
                    partNum+=1
                }
                Button("second person") {
                    appendFormAnswer(part: "2")
                    partNum+=1
                }
                Button("third person") {
                    appendFormAnswer(part: "3")
                    partNum+=1
                }
            }
        case 4:
            HStack{
                Button("singular") {
                    appendFormAnswer(part: "s,")
                    if isPassive && isPerfectPluperfect{
                        partNum+=1
                    }else{
                        partNum = -1
                    }
                }
                Button("plural") {
                    appendFormAnswer(part: "p,")
                    if isPassive && isPerfectPluperfect{
                        partNum+=1
                        
                    }else{
                        partNum = -1
                    }
                }
            }
        case 5:
            HStack{
                Button("masculine") {
                    appendFormAnswer(part: "m")
                    partNum+=1
                }
                Button("feminine") {
                    appendFormAnswer(part: "f")
                    partNum+=1
                }
                Button("neuter") {
                    appendFormAnswer(part: "n")
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
