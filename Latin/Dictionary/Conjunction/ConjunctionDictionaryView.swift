//
//  ConjunctionDictionaryView.swift
//  Latin
//
//  Created by Kenan Palmer on 07/12/2020.
//

import SwiftUI

struct ConjunctionDictionaryView: View {
    @EnvironmentObject var env: Data
    var body: some View {
        VStack{
            Text("hello")
            List(env.programData.conjunctionClassList){conj in
                NavigationLink(destination: ConjunctionInfoView(conj:conj)){
                    HStack{
                        Text(conj.word)
                        Spacer()
                        Text(String(conj.id))
                    }
                }
            }
        }
    }
}

struct ConjunctionDictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        ConjunctionDictionaryView()
    }
}
