//
//  ConjunctionStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct ConjunctionStatsWordView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        VStack{
            NavigationLink(
                destination: Text("All"),
                label: {
                    HStack{
                        Spacer()
                        Text("All")
                    }
                })
            List(env.programData.conjunctionClassList){conj in
                HStack{
                    wordRowView(word:conj.firstPrincipalPart)
                    Spacer()
                    Text(String(conj.id))
                }
            }
        }
    }
}
struct ConjunctionStatsTypeView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        Text("TYPES")
    }
}
