//
//  adjectiveView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 27/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI
//ADJECTIVES - SHOWS ALL THE ADJECTIVES AND THE LINKS POINT TO THE 3 DIFFERERNT TYPES OF ADJECTIVES EXPANDED VIEW
struct AdjectiveDictionaryView:View{
    @EnvironmentObject var env:Data
    var body :some View{
        List(env.programData.adjectiveClassList){adj in
            if adj.fileLine.contains("1/2"){
                NavigationLink(destination:AdjectiveOneTwoInfoView(adjective: adj as! FirstSecondAdjective)){
                    Text(adj.mascNom)
                }
            }
            if adj.fileLine.contains("3"){
                NavigationLink(destination:AdjectiveThirdInfoView(adjective: adj as! ThirdAdjective)){
                    Text(adj.mascNom)
                }
            }
            if adj.fileLine.contains("indeclinable"){
                NavigationLink(destination:AdjectiveIndeclinableInfoView(adjective: adj as! IndeclinableAdjective)){
                Text(adj.mascNom)
                }
            }
        }
    }
}
