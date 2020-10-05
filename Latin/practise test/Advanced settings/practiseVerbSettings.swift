//
//  practiseVerbSettings.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 15/08/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct practiseVerbSettings: View {
    @ObservedObject var practise:Practise
    @ObservedObject var programDatabase:ProgramDatabase=PROGRAMDATABASE
    var body: some View {
        List(programDatabase.verbClassList){verb in
            HStack{
                Button(action: {
                    verb.isUsed.toggle()
                }){
                    HStack{
                        Text(verb.present1S)
                        Spacer()
                        if verb.isUsed{
                            Image(systemName: "checkmark.circle")
                        }else{
                            Image(systemName: "multiply")
                        }
                    }
                }
            }
        }
    }
}
