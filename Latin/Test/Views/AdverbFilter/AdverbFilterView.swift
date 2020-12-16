//
//  AdverbFilterView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct AdverbFilterView: View {
    @EnvironmentObject var env:Data
    var body: some View {
        HStack{
            Toggle(isOn:$env.quizSettings.Adverb){
                Text("Adverbs")
            }
            Spacer()
        }
    }
}

struct AdverbFilterView_Previews: PreviewProvider {
    static var previews: some View {
        AdverbFilterView()
    }
}
