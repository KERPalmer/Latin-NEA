//
//  testStartView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 05/08/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//
import SwiftUI
struct vocabPractiseView: View {
    @Binding var InPractise:Bool
    @ObservedObject var practise:Practise
    @State var answer:String = ""
    @State var isAnswering:Bool = true
    @State var isFinish:Bool = false
    @State var currentColor:Color = .white
    var body: some View{
        ZStack{
            if isFinish{
                practiseEndView(InPractise: $InPractise, practise: practise, answer: $answer, isAnswering: $isAnswering, isFinish: $isFinish)
            }else if isAnswering{
                PractiseQuestionView(InPractise: $InPractise, practise: practise, answer: $answer, isAnswering: $isAnswering, isFinish: $isFinish)
            }else{
                PractiseCheckView(InPractise: $InPractise, practise: practise, isAnswering: $isAnswering, answer: $answer, isFinish: $isFinish)
            }
        }
    }
}

