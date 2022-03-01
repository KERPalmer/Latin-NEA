//
//  PrepositionDictionaryView.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI
//PREPOSITION DICTIONARY - SHOWS ALL THE PREPOSITIONS AND EVEN SHOWS THE ONES USED AS PREFIXES
struct PrepositionDictionaryView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        List(env.programData.prepositionClassList){preposition in
            NavigationLink(destination: PrepositionInfoView(preposition: preposition)){
                HStack{
                    Text(preposition.word)
                        .bold()
                    Text(preposition.followedBy)
                        .bold()
                    Spacer()
                    if (preposition.isPrefix){
                        Text(" prefix ")
                        .bold()
                    }
                }
            }
        }
    }
}

struct PrepositionDictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        PrepositionDictionaryView()
    }
}
