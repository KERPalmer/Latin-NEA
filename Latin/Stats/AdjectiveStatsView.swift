//
//  AdjectiveStatsView.swift
//  Latin
//
//  Created by Kenan Palmer on 04/03/2021.
//
import Foundation
import SwiftUI

struct AdjectiveWordSelectionView: View {
    @EnvironmentObject var env:Data
    var body: some View {
            List(env.programData.adjectiveClassList){adj in
                HStack{
                    NavigationLink(destination: AdjectiveStatsWordView(chosenWord: [adj])){
                    wordRowView(word:adj.firstPrincipalPart)
                    Spacer()
                    Text(String(adj.id))
                }
            }
        }
    }
}
struct AdjectiveStatsWordView:View{
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
    
    @State var positive:Bool = false
    @State var comparative:Bool = false
    @State var superlative:Bool = false
    @State var adverb:Bool = false
    @State var indelcinable = false
    
    @State var male:Bool = false
    @State var female:Bool = false
    @State var neuter:Bool = false
    
    @State var nextClicked = false
    @State var SQLFormIDs: [Int32]?
    @State var SQLFormStatement:String = "SELECT form_id FROM Form WHERE "
    @State var StatsDiagrams: [StatsDiagram]?
    
    var body: some View {
        VStack{
        List{
            List{
                Text("Degree")
                Toggle(isOn:$positive){
                    Text("positive")
                }
                Toggle(isOn:$comparative){
                    Text("comparitive")
                }
                Toggle(isOn:$superlative){
                    Text("superlative")
                }
                Toggle(isOn:$adverb){
                    Text("adverb")
                }
                Toggle(isOn:$indelcinable){
                    Text("adverb")
                }
            }.frame(height:300)
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
            }.frame(height:300)
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
                    Text("nueter")
                }
            }.frame(height: 150)
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
        if !(positive && comparative && superlative && adverb && indelcinable) && (positive || comparative || superlative || adverb || indelcinable){
            SQLFormStatement.append("part1 IN (")
            if positive{
                SQLFormStatement.append("'\(AdjectiveDegree.positive.rawValue)',")
            }
            if comparative{
                SQLFormStatement.append("'\(AdjectiveDegree.comparative.rawValue)',")
            }
            if superlative{
                SQLFormStatement.append("'\(AdjectiveDegree.superlatative.rawValue)',")
            }
            if adverb{
                SQLFormStatement.append("'\(AdjectiveDegree.adverb.rawValue)',")
            }
            if indelcinable{
                SQLFormStatement.append("'\(AdjectiveDegree.indeclinable.rawValue)',")
            }
            SQLFormStatement = String(SQLFormStatement.dropLast())
            SQLFormStatement.append(") AND ")
        }
        if !(nom && acc && voc && gen && dat && abl) && (nom || acc || voc || gen || dat || abl){
            SQLFormStatement.append("part2 IN (")
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
        if !(male && female && neuter) && (male || female || neuter){
            SQLFormStatement.append("part3 IN (")
            if male{
                SQLFormStatement.append("'\(Gender.male.rawValue)',")
            }
            if female{
                SQLFormStatement.append("'\(Gender.female.rawValue)',")
            }
            if neuter{
                SQLFormStatement.append("'\(Gender.neuter.rawValue)',")
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
