//
//  AdjectiveInfoView.swift
//  Latin
//
//  Created by Kenan Palmer on 25/11/2020.
//

import SwiftUI

struct AdjectiveOneTwoInfoView: View {
    var adjective:FirstSecondAdjective
    var body: some View {
        VStack{
            HStack{
                Text(adjective.mascNom)
                Text(adjective.femNom)
                Text(adjective.neuNom)
            }
            List{
                HStack{
                    Text(adjective.getform(gender: <#T##String#>, caseForm: <#T##String#>))
                }
                
            }
        }
    }
}

struct AdjectiveThirdInfoView: View {
    var adjective:ThirdAdjective
    var body: some View {
        HStack{
            Text(adjective.mascNom)
            Text(adjective.mascGen)
        }
    }
}
struct AdjectiveIndeclinableInfoView: View{
    var adjective: IndeclinableAdjective
    var body: some View{
        VStack{
            
        Spacer()
        Text(adjective.mascNom)
        Spacer()
        Text(adjective.get_all_translations())
        Spacer()
        }
    }
}

