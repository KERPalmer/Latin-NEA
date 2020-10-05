//
//  DeponentInfoView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct DeponentInfoView:View{
    var verb:Verb
    @State var translationIndex:Int = 0
    var body:some View{
        VStack{
            List{
                VStack{
                    Text(verb.infinitive)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text(verb.conjugation)
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text("to \(verb.GetTranslationIndex(index: translationIndex))")
                }
                VStack{
                    Text("HI")
                }
            }.onAppear(){
                UITableView.appearance().separatorStyle = .none
            }
            .onDisappear(){
                UITableView.appearance().separatorStyle = .singleLine
            }
            //button to change the translation if there are multiple translations
            Button(action: {self.translationIndex=(self.translationIndex+1)%self.verb.translation.count}){
                HStack{
                    Spacer()
                    Text("next translation")
                        .padding(10)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .opacity(0.8)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            }
            Spacer().frame( height: 10)
        }    }
}
