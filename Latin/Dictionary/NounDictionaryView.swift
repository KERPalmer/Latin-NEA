//
//  NounDictionaryView.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI

struct NounDictionaryView: View {
    var body: some View{
        List(PROGRAMDATABASE.nounClassList){ Noun in
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
