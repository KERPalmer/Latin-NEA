//
//  practiseAdvancedSettingsView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 15/08/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct practiseAdvancedSettingsView: View {
    @ObservedObject var practise:Practise
    @ObservedObject var programDatabase:ProgramDatabase=PROGRAMDATABASE
    var body: some View {
        List{
            NavigationLink(destination: practiseVerbSettings(practise: practise)){
                Text("verbs")
                    .bold()
                    .font(.system(size: 30))
            }
            NavigationLink(destination: Text("noun selection")){
                Text("nouns")
                    .bold()
                    .font(.system(size: 30))
            }
            NavigationLink(destination: Text("prepostion selection")){
                Text("prepostions")
                    .bold()
                    .font(.system(size: 30))
            }
            NavigationLink(destination: Text("adjective selection")){
                Text("adjectives")
                    .bold()
                    .font(.system(size: 30))
            }
            NavigationLink(destination: Text("adverb selection")){
                Text("adverbs")
                    .bold()
                    .font(.system(size: 30))
            }
        }
    }
}
