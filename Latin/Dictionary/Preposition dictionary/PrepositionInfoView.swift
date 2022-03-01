//
//  PrepositionInfoView.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI
//PREPOSITIONS - DISPLAYS THE PREPOSITION, ITS TRANSLATION AND WHAT FORM THE NOUN IT IS RELATED TO SHOULD BE IN 
struct PrepositionInfoView:View{
    var preposition:Preposition
    @State var translationIndex:Int = 0
    var body: some View{
        VStack{
            Spacer().frame(height: 20)
            Text(preposition.word)
                .font(.system(size: 60))
                .bold()
                .multilineTextAlignment(.center)
            Spacer().frame(height: 50)
            Text(preposition.followedBy)
            Spacer().frame(height: 50)
            Text(format(str: preposition.translations[translationIndex]))
                .font(.system(size: 60))
            Spacer().frame(height: 50)
            Button(action: {self.translationIndex=(self.translationIndex+1)%self.preposition.translations.count}){
                Text("next translation")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .opacity(0.8)
            }
        }
    }
}
