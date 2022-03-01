//
//  VerbStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI
struct VerbWordSelectionView: View{
    @EnvironmentObject var env:Data
    @State var chosenVerb:Verb?
    var body:some View{
        ZStack{
            List(env.programData.verbClassList){ verb in
                NavigationLink(destination: VerbStatsWordView(chosenWord: [verb])){
                    Text(verb.firstPrincipalPart)
                }
            }
        }
    }
}
struct VerbStatsWordView: View {
    @EnvironmentObject var env:Data
    
    @State var chosenWord:[Word]
    @State var chosenForms: [String] = []
    
    @State var indicitive:Bool = false
    @State var subjunctive:Bool = false
    @State var active:Bool = false
    @State var passive:Bool = false
    @State var present:Bool = false
    @State var perfect:Bool = false
    @State var pluperfect:Bool = false
    @State var imperfect:Bool = false
    @State var future:Bool = false
    @State var infinitive:Bool = false
    @State var first:Bool = false
    @State var second:Bool = false
    @State var third:Bool = false
    @State var singular = false
    @State var plural:Bool = false
    @State var male:Bool = false
    @State var female:Bool = false
    @State var neuter: Bool = false
    
    @State var nextClicked = false
    @State var SQLFormIDs: [Int32]?
    @State var SQLFormStatement:String = "SELECT form_id FROM Form WHERE "
    @State var StatsDiagrams: [StatsDiagram]?
    
    var body: some View {
        VStack{
        List{
            List{
                Text("Moods")
                Toggle(isOn: $indicitive){
                    Text("indicitive")
                }
                Toggle(isOn: $subjunctive){
                    Text("subjunctive")
                }
            }.frame(height:150)
            List{
                Text("Voices")
                Toggle(isOn: $active){
                    Text("active")
                }
                Toggle(isOn: $passive){
                    Text("passive")
                }
            }.frame(height:150)
            List{
                Text("Tenses")
                Toggle(isOn:$present){
                    Text("present")
                }
                Toggle(isOn:$imperfect){
                    Text("imperfect")
                }
                Toggle(isOn:$perfect){
                    Text("perfect")
                }
                Toggle(isOn:$pluperfect){
                    Text("pluperfect")
                }
                Toggle(isOn:$future){
                    Text("future")
                }
                Toggle(isOn:$infinitive){
                    Text("infintive")
                }
            }.frame(height:350)
            List{
                Toggle(isOn:$first){
                    Text("first")
                }
                Toggle(isOn:$second){
                    Text("second")
            }
                Toggle(isOn:$third){
                    Text("third")
        }
    }.frame(height:150)
            List{
                Toggle(isOn:$singular){
                    Text("single")
            }
                Toggle(isOn:$plural){
                    Text("plural")
                }
            }.frame(height:150)
            List{
                Toggle(isOn:$male){
                    Text("male")
            }
                Toggle(isOn:$female){
                    Text("female")
                }
                Toggle(isOn:$neuter){
                    Text("neuter")
                }
            }.frame(height:150)
        }
            
        HStack{
                if nextClicked{
                    HStack{
                    Spacer()
                        NavigationLink(destination: StatsDiagramView(stats: StatsDiagrams ?? [])){
                    Text("yes")
                    }
                    Spacer()
                    Button("no"){
                        nextClicked = false
                        chosenForms = []
                        StatsDiagrams = []
                    }
                    Spacer()
                    }
                }
                else{
                    Button("next"){
                        nextClicked = true
                        SetIDs()
                        StatsDiagrams = env.db!.GetDiagrams(words: chosenWord, formIDs: SQLFormIDs!, profileID: env.profileID)
                        
                    }
                }
            }
        }
    }
    func SetIDs(){
        if indicitive && !subjunctive{
            SQLFormStatement.append("part1 = '\(Mood.indicative.rawValue)' AND ")
        }
        else if subjunctive{
            SQLFormStatement.append("part1 = '\(Mood.subjunctive.rawValue)' AND ")
        }
        if active && !passive{
            SQLFormStatement.append("part2 = '\(Voice.active.rawValue)' AND " )
        }else if passive{
            SQLFormStatement.append("part2 = '\(Voice.passive.rawValue)' AND ")
        }
        if !(present && imperfect && future && perfect && pluperfect && infinitive) && (present || imperfect || future || perfect || pluperfect || infinitive){
            SQLFormStatement.append("part3 IN (")
            if present{
                SQLFormStatement.append("'\(Tense.Present.rawValue)',")
            }
            if imperfect{
                SQLFormStatement.append("'\(Tense.imperfect.rawValue)',")
            }
            if perfect{
                SQLFormStatement.append("'\(Tense.perfect.rawValue)',")
            }
            if future{
                SQLFormStatement.append("'\(Tense.future.rawValue)',")
            }
            if pluperfect{
                SQLFormStatement.append("'\(Tense.pluperfect.rawValue)',")
            }
            if infinitive{
                SQLFormStatement.append("'\(Tense.infinitive.rawValue)',")
            }
            SQLFormStatement = String(SQLFormStatement.dropLast())
            SQLFormStatement.append(") AND ")
            
        }
        if !(first && second && third) && (first || second || third) {
            SQLFormStatement.append("part4 IN (")
            if first && singular{
                SQLFormStatement.append("'\(PersonNum.FirstSingular.rawValue)',")
            }
            if first && plural{
                SQLFormStatement.append("'\(PersonNum.FirstPlural.rawValue)',")
            }
            if second && singular{
                SQLFormStatement.append("'\(PersonNum.SecondSingular.rawValue)',")
            }
            if second && plural{
                SQLFormStatement.append("'\(PersonNum.SecondSingular.rawValue)',")
            }
            if third && plural{
                SQLFormStatement.append("'\(PersonNum.ThirdPlural.rawValue)',")
            }
            if third && plural{
                SQLFormStatement.append("'\(PersonNum.ThirdPlural.rawValue)',")
            }
            SQLFormStatement = String(SQLFormStatement.dropLast()) // remove last comma
            SQLFormStatement.append(") AND ")
        }
        if !(male && female && neuter) && (male || female || neuter){
            SQLFormStatement.append("part5 IN (")
            if male{
                SQLFormStatement.append("'\(Gender.male.rawValue)'")
            }
            if female{
                SQLFormStatement.append("'\(Gender.female.rawValue)'")
            }
            if neuter{
                SQLFormStatement.append("'\(Gender.neuter.rawValue)'")
            }
            SQLFormStatement = String(SQLFormStatement.dropLast()) // remove last comma
            SQLFormStatement.append(") AND ")
        }
        SQLFormStatement = String(SQLFormStatement.dropLast(4))
        SQLFormStatement.append(";")
        print(SQLFormStatement)
        SQLFormIDs = env.db?.GetStatsForms(query: SQLFormStatement)
    }
}


