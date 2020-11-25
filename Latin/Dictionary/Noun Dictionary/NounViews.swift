//
//  NounViews.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 27/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct nounInfoView:View{
    var noun:Noun
    @State var translationIndex:Int = 0
    var body:some View{
        VStack{
            HStack{
                Spacer()
                    .frame(width: 20)
                Text(noun.nominativeS)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                Text("/")
                Text(noun.genativeS)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                Spacer()
                    .frame(width: 20)
            }
            HStack{
                Text(noun.declension)
                Text(noun.gender)
            }
            Text(noun.get_translation())
            Text("singular")
                .bold()
                .underline()
            VStack{
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "nom_s"))
                    Spacer()
                        .frame(width: 20)
                    Text("nominative singular")
                    Spacer()
                    Text("subject:  \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "voc_s"))
                    Spacer()
                        .frame(width: 20)
                    Text("vocative singular")
                    Spacer()
                    Text( "O  \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "acc_s"))
                    Spacer()
                        .frame(width: 20)
                    Text("accusative singular")
                    Spacer()
                    Text( "object:  \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "gen_s"))
                    Spacer()
                        .frame(width: 20)
                    Text("genative singular")
                    Spacer()
                    Text( "of the   \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "dat_s"))
                    Spacer()
                        .frame(width: 20)
                    Text("dative singular")
                    Spacer()
                    Text( "to/for the   \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "abl_s"))
                    Spacer()
                        .frame(width: 20)
                    Text("ablative singular")
                    Spacer()
                    Text( "by/with/from   \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
            }
            Spacer()
            Text("plural")
                .bold()
                .underline()
            VStack{
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "nom_p"))
                    Spacer()
                        .frame(width: 20)
                    Text("nominative plural")
                    Spacer()
                    Text( "subject:  \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "voc_p"))
                    Spacer()
                        .frame(width: 20)
                    Text("vocative plural")
                    Spacer()
                    Text( "O  \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "acc_p"))
                    Spacer()
                        .frame(width: 20)
                    Text("accusative plural")
                    Spacer()
                    Text( "objects:  \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "gen_p"))
                    Spacer()
                        .frame(width: 20)
                    Text("genative plural")
                    Spacer()
                    Text( "of the   \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "dat_p"))
                    Spacer()
                        .frame(width: 20)
                    Text("dative plural")
                    Spacer()
                    Text( "to/for the \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                HStack {
                    Spacer()
                        .frame(width: 20)
                    Text(noun.GetDeclension(choice: "abl_p"))
                    Spacer()
                        .frame(width: 20)
                    Text("ablative plural")
                    Spacer()
                    Text( "by/with/from  \(noun.get_translation())")
                    Spacer()
                        .frame(width: 20)
                }
                Spacer()
                Button(action: {self.translationIndex=(self.translationIndex+1)%self.noun.translations.count}){
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
}
struct nounDictionaryView: View {
    @EnvironmentObject var env:Data
    var body: some View{
        List(env.programData.nounClassList){ Noun in
            NavigationLink(destination: nounInfoView(noun:Noun)){
                HStack{
                    Text(Noun.nominativeS)
                    Spacer()
                    Text(String(Noun.id))
                }
            }
        }.navigationBarTitle("Nouns")
    }
}
