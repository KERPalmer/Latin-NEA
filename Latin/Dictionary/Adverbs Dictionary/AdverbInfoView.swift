//
//  AdverbInfoView.swift
//  Latin
//
//  Created by Kenan Palmer on 07/12/2020.
//

import SwiftUI
//ADVERBS ARE VERY SIMPLE THEY DONT CHANGE SO ALL WE NEED IS THE TRANSLATION
struct AdverbInfoView: View {
    var adv:Adverb
    var body: some View {
        VStack{
            Text(adv.word)
            Text(adv.get_all_translations())
        }
    }
}
