//
//  PractiseCheckView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 11/08/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct PractiseCheckView: View {
    @Binding var InPractise:Bool
    @ObservedObject var practise:Practise
    @ObservedObject var programDatabase:ProgramDatabase=PROGRAMDATABASE
    @Binding var isAnswering:Bool
    @Binding var answer:String
    @Binding var isFinish:Bool
    var body: some View {
        ZStack{
            if practise.question.correct{
                Rectangle()
                    .fill(Color.green)
                    .edgesIgnoringSafeArea(.all)
            }else{
                Rectangle()
                    .fill(Color.red)
                    .edgesIgnoringSafeArea(.all)
            }
            VStack{
                Text(practise.question.latinWord)
                    .font(.title)
                ScrollView(.horizontal){
                    HStack{
                        Spacer()
                        ForEach(practise.question.englishTranslations, id: \.self) {translation in
                            Text(translation)
                                .bold()
                                .multilineTextAlignment(.center)
                        }
                        Spacer()
                    }
                }
                HStack{
                    Text("you said")
                    Text(answer)
                }
                Button(action: {
                    self.practise.setVocabQuestion()
                    self.isAnswering=true
                }){
                    HStack{
                        Spacer()
                        Text("next")
                            .padding(30)
                            .background(Color.black)
                            .foregroundColor(.green)
                            .cornerRadius(20)
                            .opacity(0.8)
                            .multilineTextAlignment(.center)
                        Spacer()
                        
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
            }
        }
    }
}
