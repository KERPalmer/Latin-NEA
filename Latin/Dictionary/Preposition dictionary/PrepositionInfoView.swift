//
//  PrepositionInfoView.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI

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
            Text(format(str: preposition.translation[translationIndex]))
                .font(.system(size: 60))
            Spacer().frame(height: 50)
            Button(action: {self.translationIndex=(self.translationIndex+1)%self.preposition.translation.count}){
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
