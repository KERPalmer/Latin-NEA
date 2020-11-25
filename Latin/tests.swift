//
//  tests.swift
//  Latin
//
//  Created by Kenan Palmer on 23/11/2020.
//

import SwiftUI

struct tests: View {
    @EnvironmentObject var env:Data
    var body: some View {
        HStack{
            List(env.programData.GetVerbs()){verb in
                Text(verb.GetPresent(str: "3s"))
            }
        }.onAppear(){
            //env.programData.printVerbs()
        }
    }
}

struct tests_Previews: PreviewProvider {
    static var previews: some View {
        tests()
    }
}
