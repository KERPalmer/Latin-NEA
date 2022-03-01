//
//  ContentView.swift
//  Latin
//  Created by Kenan Palmer on 05/10/2020.import SwiftUI
//THIS VIEWS PROVIDES THE TABS YOU SEE AT THE BOTTOM OF THE SCREEN. EACH TAB RUN SIMULATEOUSLY AND WHAT YOU DO IN ONE TAB SHOULDNT EFFECT THE OTHERS
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
            QuizView().environmentObject(Quiz(enviroment: env, storeResults_: true))
                .tabItem {
                    VStack {
                        Text("Practise")
                        Image(systemName: "target")
                    }
                }
                .tag(1)
            StatsWordView()
                .font(.title)
                .tabItem {
                    VStack {
                        Text("Stats")
                        Image(systemName: "percent")
                    }
                }.tag(2)
            ProfileSettingsView()
                .font(.title)
                .tabItem {
                    VStack {
                        Text("Settings")
                        Image(systemName: "gearshape")
                    }
                }.tag(3)
        }
    }
}
