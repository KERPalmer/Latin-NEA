//
//  AdverbsStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct AdverbStatsWordView: View {
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
            List(env.programData.adverbClassList){adverb in
                HStack{
                    wordRowView(word:adverb.firstPrincipalPart)
                    Spacer()
                    Text(String(adverb.id))
                }
            }
        }
    }
}
struct AdverbStatsTypeView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        Text("TYPES")
    }
}
