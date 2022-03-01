//
//  Dictionary.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//
import SwiftUI

struct PractiseView: View{
    @ObservedObject var practise:Practise
    @ObservedObject var programDatabase:ProgramDatabase=PROGRAMDATABASE
    @Binding var InPractise:Bool
    var body: some View{
        ZStack{
            if (practise.isVocabPractise == true){
                vocabPractiseView(InPractise: $InPractise,practise: practise)
            }
        }
    }
}
