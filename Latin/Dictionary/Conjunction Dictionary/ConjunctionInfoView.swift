//
//  ConjunctionInfoView.swift
//  Latin
//
//  Created by Kenan Palmer on 07/12/2020.
//

import SwiftUI
//CONJUNCTIONS DONT CHANGE SO WE CAN JUST SHOW THEIR TRANSLATION AND IF THEY NEEDED TO BE FOLLOWED BY ANYHTING
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
