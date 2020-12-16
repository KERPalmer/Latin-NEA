//
//  ConjunctionFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct ConjunctionFilterView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        HStack{
            Toggle(isOn:$env.quizSettings.Conjunctions){
                Text("Conjunctions")
            }
            Spacer()
        }
    }
}

struct ConjunctionFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ConjunctionFilterView()
    }
}
