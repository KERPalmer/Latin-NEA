//
//  NounStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct NounStatsWordView: View {
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
            List(env.programData.nounClassList){noun in
                HStack{
                    wordRowView(word:noun.firstPrincipalPart)
                    Spacer()
                    Text(String(noun.id))
                }
            }
        }
    }
}
struct NounStatsTypeView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        Text("TYPES")
    }
}
