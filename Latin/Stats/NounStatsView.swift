//
//  NounStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//

import SwiftUI

struct NounWordSelectionView: View {
    @EnvironmentObject var env:Data
    var body: some View {
            List(env.programData.nounClassList){noun in
                HStack{
                    NavigationLink(destination: NounStatsWordView(chosenWord: [noun])){
                    wordRowView(word:noun.firstPrincipalPart)
                    Spacer()
                    Text(String(noun.id))
                }
            }
        }
    }
}
struct NounStatsWordView:View{
    @EnvironmentObject var env:Data
    
    @State var chosenWord:[Word]
    @State var chosenForms: [String] = []
    
    @State var nom:Bool = false
    @State var voc:Bool = false
    @State var acc:Bool = false
    @State var gen:Bool = false
    @State var dat:Bool = false
    @State var abl:Bool = false
    @State var singular:Bool = false
    @State var plural:Bool = false
    
    @State var nextClicked = false
    @State var SQLFormIDs: [Int32]?
    @State var SQLFormStatement:String = "SELECT form_id FROM Form WHERE "
    @State var StatsDiagrams: [StatsDiagram]?
    
    var body: some View {
        VStack{
        List{
            List{
                Text("Cases")
                Toggle(isOn:$nom){
                    Text("nominative")
                }
                Toggle(isOn:$voc){
                    Text("vocative")
                }
                Toggle(isOn:$acc){
                    Text("accusative")
                }
                Toggle(isOn:$dat){
                    Text("dative")
                }
                Toggle(isOn:$abl){
                    Text("ablative")
                }
            }.frame(height:350)
            List{
                Toggle(isOn:$singular){
                    Text("single")
            }
                Toggle(isOn:$plural){
                    Text("plural")
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
        if !(nom && acc && voc && gen && dat && abl) && (nom || acc || voc || gen || dat || abl){
            SQLFormStatement.append("part1 IN (")
            if nom{
                if (singular && plural) || !(singular || plural){
                    SQLFormStatement.append("'\(caseNum.NomSingular.rawValue)',")
                    SQLFormStatement.append("'\(caseNum.NomSingular.rawValue)',")
                }
                else if singular{
                    SQLFormStatement.append("'\(caseNum.NomSingular.rawValue)',")
                }
                else if plural{
                    SQLFormStatement.append("'\(caseNum.NomSingular.rawValue)',")
                }
            }
            if voc{
                if (singular && plural) || !(singular || plural){
                    SQLFormStatement.append("'\(caseNum.VocSingular.rawValue)',")
                    SQLFormStatement.append("'\(caseNum.VocSingular.rawValue)',")
                }
                else if singular{
                    SQLFormStatement.append("'\(caseNum.VocSingular.rawValue)',")
                }
                else if plural{
                    SQLFormStatement.append("'\(caseNum.VocSingular.rawValue)',")
                }
            }
            if acc{
                if (singular && plural) || !(singular || plural){
                    SQLFormStatement.append("'\(caseNum.AccSingular.rawValue)',")
                    SQLFormStatement.append("'\(caseNum.AccSingular.rawValue)',")
                }
                else if singular{
                    SQLFormStatement.append("'\(caseNum.AccSingular.rawValue)',")
                }
                else if plural{
                    SQLFormStatement.append("'\(caseNum.AccSingular.rawValue)',")
                }
            }
            if gen{
                if (singular && plural) || !(singular || plural){
                    SQLFormStatement.append("'\(caseNum.GenSingular.rawValue)',")
                    SQLFormStatement.append("'\(caseNum.GenSingular.rawValue)',")
                }
                else if singular{
                    SQLFormStatement.append("'\(caseNum.GenSingular.rawValue)',")
                }
                else if plural{
                    SQLFormStatement.append("'\(caseNum.GenSingular.rawValue)',")
                }
            }
            if dat{
                if (singular && plural) || !(singular || plural){
                    SQLFormStatement.append("'\(caseNum.DatSingular.rawValue)',")
                    SQLFormStatement.append("'\(caseNum.DatSingular.rawValue)',")
                }
                else if singular{
                    SQLFormStatement.append("'\(caseNum.DatSingular.rawValue)',")
                }
                else if plural{
                    SQLFormStatement.append("'\(caseNum.DatSingular.rawValue)',")
                }
            }
            if abl{
                if (singular && plural) || !(singular || plural){
                    SQLFormStatement.append("'\(caseNum.AblSingular.rawValue)',")
                    SQLFormStatement.append("'\(caseNum.AblSingular.rawValue)',")
                }
                else if singular{
                    SQLFormStatement.append("'\(caseNum.AblSingular.rawValue)',")
                }
                else if plural{
                    SQLFormStatement.append("'\(caseNum.AblSingular.rawValue)',")
                }
            }
            SQLFormStatement = String(SQLFormStatement.dropLast())
            SQLFormStatement.append(") AND ")
            
        }
        SQLFormStatement = String(SQLFormStatement.dropLast(4))
        SQLFormStatement.append(";")
        print(SQLFormStatement)
        SQLFormIDs = env.db?.GetStatsForms(query: SQLFormStatement)
    }
}
