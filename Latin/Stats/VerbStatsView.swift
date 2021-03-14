//
//  VerbStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct VerbStatsWordView: View {
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
            List(env.programData.verbClassList){verb in
                NavigationLink(destination: VerbStatsInfoView(verb: verb)){
                    HStack{
                        wordRowView(word:verb.present1S)
                        Spacer()
                        Text(String(verb.id))
                    }
                }
            }
        }
    }
}

struct VerbStatsTypeView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        Text("TYPES")
    }
}
struct VerbStatsInfoView:View {
    @EnvironmentObject var env:Data
    var verb:Verb
    var body: some View{
        List{
            VStack{
                Text("Present")
                
            }
        }
    }
}
