//
//  SwiftUIView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct wordRowView: View{
    var word:String
    var body: some View{
        Text(word)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        wordRowView(word: "test")
    }
}
