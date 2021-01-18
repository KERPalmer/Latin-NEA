//
//  DeponentInfoView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct DeponentInfoView:View{
    var verb:Verb
    var body:some View{
        VStack{
            List{
                VStack{
                    Text(verb.infinitive)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text(verb.conjugation.rawValue)
                        .font(.headline)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text("to \(verb.get_translation())")
                }
                VStack{
                    Text("HI")
                }
            }.onAppear(){
                UITableView.appearance().separatorStyle = .none
            }
            .onDisappear(){
                UITableView.appearance().separatorStyle = .singleLine
            }
            Spacer().frame( height: 10)
        }    }
}
