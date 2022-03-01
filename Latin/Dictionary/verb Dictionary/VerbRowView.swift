//
//  VerbRowView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI
// A SINGLE PLACE TO CHANGE THE STYLE OF THE ROWS OF VERBS IN THE DICTIONARY VIEW...YOU CAN JAZZZ IT ALL UP HERE
struct VerbRowView: View{
    var word:String
    var formList:[String]
    var grammar:String
    var body: some View{
        NavigationLink(destination: VerbContextView(mood: Mood.init(rawValue: formList[0])!, voice: Voice.init(rawValue: formList[1])!, tense: Tense.init(rawValue: formList[2])!, personNum: PersonNum.init(rawValue: formList[3])!)){
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
}
struct VerbContextView: View{
    let mood:Mood
    let voice:Voice
    let tense:Tense
    let personNum:PersonNum
    var body: some View{
        VStack{
            HStack{
                Text(mood.rawValue)
                Spacer()
                Text(voice.rawValue)
                Spacer()
                Text(tense.rawValue)
                Spacer()
                Text(personNum.rawValue)
            }.font(.title2)
            List{
            switch mood {
            case .indicative:
                Text(Verb.Context.indicitve.rawValue)
            case .subjunctive:
                Text(Verb.Context.subjunctive.rawValue)
            }
            switch voice{
            case .active:
                Text(Verb.Context.active.rawValue)
            case .passive:
                Text(Verb.Context.passive.rawValue)
            }
            switch tense{
            case .Present:
                Text(Verb.Context.present.rawValue)
            case .imperfect:
                Text(Verb.Context.imperfect.rawValue)
            case .perfect:
                Text(Verb.Context.perfect.rawValue)
            case .pluperfect:
                Text(Verb.Context.pluperfect.rawValue)
            case .future:
                Text(Verb.Context.future.rawValue)
            case .infinitive:
                Text(Verb.Context.inifinitve.rawValue)
            }
            switch personNum{
            case .FirstSingular:
                Text(Verb.Context.FirstPerson.rawValue)
                Text(Verb.Context.singular.rawValue)
            case .SecondSingular:
                Text(Verb.Context.SecondPerson.rawValue)
                Text(Verb.Context.singular.rawValue)
            case .ThirdSingular:
                Text(Verb.Context.ThirdPerson.rawValue)
                Text(Verb.Context.singular.rawValue)
            case .FirstPlural:
                Text(Verb.Context.FirstPerson.rawValue)
                Text(Verb.Context.plural.rawValue)
            case .SecondPlural:
                Text(Verb.Context.SecondPerson.rawValue)
                Text(Verb.Context.plural.rawValue)
            case .ThirdPlural:
                Text(Verb.Context.ThirdPerson.rawValue)
                Text(Verb.Context.plural.rawValue)
            }
            }
        }
    }
}

struct VerbRowView_Previews: PreviewProvider {
    static var previews: some View {
        VerbRowView(word: "test word", formList: ["test"], grammar: "test grammar")
    }
}
