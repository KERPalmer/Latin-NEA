//
//  PractiseQuestionView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 11/08/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct PractiseQuestionView: View {
    @Binding var InPractise:Bool
    @ObservedObject var practise:Practise
    @ObservedObject var programDatabase:ProgramDatabase=PROGRAMDATABASE
    @Binding var answer:String
    @Binding var isAnswering:Bool
    @Binding var isFinish: Bool
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
            VStack{
                VStack{
                    Text(self.practise.question.latinWord)
                        .bold()
                        .font(.title)
                    Spacer().frame(height: 10)
                    TextField(self.practise.question.englishTranslations[0], text:self.$answer).textFieldStyle(RoundedBorderTextFieldStyle())
                    Spacer().frame(height:10)
                    HStack{
                        Text(practise.question.latinWord)
                    }
                }
                Button(action: {
                    self.practise.question.correct = self.practise.checkAnswer(answer: self.answer)
                    self.practise.previousQuestions.append(self.practise.question)
                    self.isAnswering = false
                }){
                    HStack{
                        Spacer().frame(height:10)
                        Text("check")
                            .padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
                            .background(Color.black)
                            .foregroundColor(.green)
                            .cornerRadius(20)
                            .opacity(0.8)
                            .multilineTextAlignment(.center)
                        Spacer().frame(height:10)
                        
                    }
                }
                Spacer()
                Button(action: {
                    self.isFinish=true
                }){
                    HStack{
                        Spacer().frame(height:10)
                        Text("finish")
                            .padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
                            .background(Color.black)
                            .foregroundColor(.green)
                            .cornerRadius(20)
                            .opacity(0.8)
                            .multilineTextAlignment(.center)
                        Spacer().frame(height:10)
                    }
                }
                Spacer()
            }
        }
    }
}
