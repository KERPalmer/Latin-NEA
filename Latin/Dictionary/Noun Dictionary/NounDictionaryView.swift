//
//  NounDictionaryView.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI
//NOUN DICTIONARY - SHOWS ALL THE NOUNS IN A LIST
struct NounDictionaryView: View {
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

struct NounDictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        NounDictionaryView()
    }
}
