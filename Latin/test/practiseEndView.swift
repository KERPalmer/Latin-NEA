//
//  practiseEndView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 14/08/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct practiseEndView: View {
    @Binding var InPractise:Bool
    @ObservedObject var practise:Practise
    @ObservedObject var programDatabase:ProgramDatabase=PROGRAMDATABASE
    @Binding var answer:String
    @Binding var isAnswering:Bool
    @Binding var isFinish: Bool
    var body: some View {
        ZStack{
            List(practise.previousQuestions){previous in
                HStack{
                    Text(previous.latinWord)
                    Spacer()
                    Text(previous.englishTranslations[0])
                    Spacer()
                    Text(String(previous.correct))
                }.background(previous.GetBackgroundColor())
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
