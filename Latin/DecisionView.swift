//
//  DecisionView.swift
//  GCSE Latin Buddy
//
//  Created by Kenan Palmer on 04/10/2020.
//  Copyright © 2020 Kenan Palmer. All rights reserved.
//

import SwiftUI

struct DecisionView:View{
    @EnvironmentObject var env:Data
    @State private var selection = 0
    var body : some View{
        TabView(selection: $selection){
            DictionaryView()
                .tabItem {
                    VStack {
                        Text("Dictionary")
                        Image(systemName: "a.book.closed")
                    }
                }
                .tag(0)
            QuizView().environmentObject(Quiz(enviroment: env))
                .tabItem {
                    VStack {
                        Text("Practise")
                        Image(systemName: "target")
                    }
                }
                .tag(1)
            Text("test")
                .font(.title)
                .tabItem {
                    VStack {
                        Text("Test")
                        Image(systemName: "graduationcap")
                    }
                }
                .tag(2)
            Text("stats")
                .font(.title)
                .tabItem {
                    VStack {
                        Text("Stats")
                        Image(systemName: "percent")
                    }
                }
                .tag(3)
        }
        
    }
}


struct DecisionView_Previews: PreviewProvider {
    static var previews: some View {
        DecisionView()
    }
}
