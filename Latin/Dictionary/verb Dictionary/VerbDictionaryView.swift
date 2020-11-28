//
//  VerbDictionaryView.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI

struct VerbDictionaryView: View {
    @EnvironmentObject var env: Data
    var body: some View{
        List(env.programData.verbClassList){verb in
            if verb.fileLine.contains("deponent"){
                NavigationLink(destination: DeponentInfoView(verb: verb)){
                    HStack{
                        wordRowView(word:verb.present1S)
                        Spacer()
                        Text(String(verb.id))
                    }
                }.navigationBarTitle("verbs")
                .onAppear(){
                        UITableView.appearance().separatorStyle = .singleLine
                }
            }else{
                NavigationLink(destination: VerbInfoView(verb: verb)){
                    HStack{
                        wordRowView(word:verb.present1S)
                        Spacer()
                        Text(String(verb.id))
                    }
                }
        .navigationBarTitle("verbs")
        .onAppear(){
                UITableView.appearance().separatorStyle = .singleLine
                }
            }
        }
    }
}
struct VerbDictionaryView_Previews: PreviewProvider {
    static var previews: some View {
        VerbDictionaryView().environmentObject(Data())
    }
}
