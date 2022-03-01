//
//  NounViews.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 27/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI
//NOUN DICTIONARY - THIS SHOWS AL LTHE FORMS FOR NOUNS
struct nounInfoView:View{
    var noun:Noun
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
                Text(noun.declension.rawValue)
                Text(noun.gender.rawValue)
            }
            Text(noun.get_all_translations())
                .font(.subheadline)
                .bold()
                .multilineTextAlignment(.center)
            Text("singular")
                .bold()
                .underline()
            List{
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.NomSingular), caseNumber: caseNum.NomSingular)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.VocSingular), caseNumber: caseNum.VocSingular)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.AccSingular), caseNumber: caseNum.AccSingular)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.GenSingular), caseNumber: caseNum.GenSingular)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.DatSingular), caseNumber: caseNum.DatSingular)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.AblSingular), caseNumber: caseNum.AblSingular)
        }
            Text("plural")
                .bold()
                .underline()
            List{
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.NomPlural), caseNumber: caseNum.NomPlural)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.VocPlural), caseNumber: caseNum.VocPlural)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.AccPlural), caseNumber: caseNum.AccPlural)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.GenPlural), caseNumber: caseNum.GenPlural)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.DatPlural), caseNumber: caseNum.DatPlural)
                NounRowView(nounString: noun.GetDeclension(choice: caseNum.AblPlural), caseNumber: caseNum.AblPlural)
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
