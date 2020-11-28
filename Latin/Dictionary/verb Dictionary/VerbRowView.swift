//
//  VerbRowView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct VerbRowView: View{
    var word:String
    var grammar:String
    var body: some View{
        HStack{
            Spacer()
                .frame(width: 20)
            Text(word)
            Spacer()
            Text(grammar)
            Spacer()
                .frame(width: 20)
        }
    }
}

struct VerbRowView_Previews: PreviewProvider {
    static var previews: some View {
        VerbRowView(word: "test word", grammar: "test grammar")
    }
}
