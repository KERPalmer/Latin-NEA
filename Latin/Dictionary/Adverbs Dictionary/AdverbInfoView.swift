//
//  AdverbInfoView.swift
//  Latin
//
//  Created by Kenan Palmer on 07/12/2020.
//

import SwiftUI

struct AdverbInfoView: View {
    var adv:Adverb
    var body: some View {
        VStack{
            Text(adv.word)
            Text(adv.get_all_translations())
        }
    }
}
