//
//  PrepositionStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct PrepositionStatsWordView: View {
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
            List(env.programData.prepositionClassList){prep in
                HStack{
                    wordRowView(word:prep.firstPrincipalPart)
                    Spacer()
                    Text(String(prep.id))
                }
            }
        }
    }
}
struct PrepositionStatsTypeView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        Text("TYPES")
    }
}
