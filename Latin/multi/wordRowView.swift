//
//  SwiftUIView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI
//THE VIEW TO SHOW A ROW IN THE DICTIONARY...THIS CAN BE CHANGED LATER IF YOU WANT TO  JAZZ UP THE STYLE
struct wordRowView: View{
    var word:String
    var body: some View{
        Text(word)
    }
}
//FOR DEBUGGING
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        wordRowView(word: "test")
    }
}
