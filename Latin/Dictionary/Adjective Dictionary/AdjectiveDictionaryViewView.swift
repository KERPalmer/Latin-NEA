//
//  adjectiveView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 27/07/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct AdjectiveDictionaryView:View{
    @EnvironmentObject var env:Data
    var body :some View{
        List(env.programData.adjectiveClassList){adjective in
            Text(adjective.fileLine)
        }
    }
}
