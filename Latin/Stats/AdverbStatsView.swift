//
//  AdverbsStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI


struct AdverbWordSelectionView: View {
    @EnvironmentObject var env:Data
    @State var statsDiagrams:[StatsDiagram]?
    var body: some View {
        List(env.programData.adverbClassList){adv in
            NavigationLink(destination: AdverbStatsWordView(chosenWord: [adv])){
                HStack{
                    Text(adv.firstPrincipalPart)
                    Spacer()
                    Text(String(adv.id))
                }
            }
        }
    }
}
struct AdverbStatsWordView:View{
    @EnvironmentObject var env:Data
    
    @State var chosenWord:[Word]
    @State var chosenForms: [String] = []
    
    @State var nextClicked = false
    @State var SQLFormIDs: [Int32]?
    @State var SQLFormStatement:String = "SELECT form_id From Form Where part6 = \(WordTypes.Adverb.rawValue)"
    @State var StatsDiagrams: [StatsDiagram]?
    
    var body: some View{
        VStack{
            Text(chosenWord[0].firstPrincipalPart)
            Text(chosenWord[0].get_translation())
            if  !nextClicked{
            Button("Get stats"){
                StatsDiagrams = GetStatsDiagram(word: chosenWord[0])
                nextClicked = true
            }
            }else{
                NavigationLink(destination:StatsDiagramView(stats: StatsDiagrams ?? [])){
                    Text("View Results")
                }
            }
        }
    }
    func GetFormIDs(env:Data)->[Int32]{
        return env.db?.GetStatsForms(query: "SELECT form_id From Form Where part6 = '\(WordTypes.Adverb.rawValue)'") ?? []
    }
    func GetStatsDiagram(word:Word)->[StatsDiagram]{
        let formIDs = GetFormIDs(env: env)
        return env.db?.GetDiagrams(words: chosenWord, formIDs: formIDs, profileID: env.profileID) ?? []
    }
}

