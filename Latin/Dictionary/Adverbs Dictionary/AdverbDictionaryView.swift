//
//  AdverbDictionaryView.swift
//  Latin
//
//  Created by Kenan Palmer on 07/12/2020.
//

import SwiftUI

struct AdverbDictionaryView: View {
    @EnvironmentObject var env: Data
    var body: some View {
        VStack{
            Text("hello")
            List(env.programData.adverbClassList){adv in
                NavigationLink(destination: AdverbInfoView(adv:adv)){
                    HStack{
                        Text(adv.word)
                        Spacer()
                        Text(String(adv.id))
                    }
                }
            }
        }
    }
}

