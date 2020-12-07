//
//  SwiftUIView.swift
//  Latin
//
//  Created by Kenan Palmer on 07/12/2020.
//

import SwiftUI

struct ConjunctionDictionaryView: View {
    @EnvironmentObject var env: Data
    var body: some View {
        List(env.programData.conjunctionClassList){conj in
            Text(conj.word)
        }
    }
}
