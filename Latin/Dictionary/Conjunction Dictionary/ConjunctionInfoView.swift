//
//  ConjunctionInfoView.swift
//  Latin
//
//  Created by Kenan Palmer on 07/12/2020.
//

import SwiftUI

struct ConjunctionInfoView: View {
    var conj:Conjunction
    var body: some View {
        VStack{
            Text(conj.word)
            Text(conj.get_all_translations())
            if conj.followedBy != "none"{
                Text(conj.followedBy)
            }
        }
    }
}
