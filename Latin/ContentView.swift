//
//  ContentView.swift
//  Latin
//  Created by Kenan Palmer on 05/10/2020.
//THIS VIEW SEPERATES THE LOGIN PAGE FROM THE REST OF THE PROGRAM

import SwiftUI
struct ContentView: View {
    @EnvironmentObject var env:Data
    @State var loaded:Bool=false
    private var debug:Bool = true
    var body: some View {
        VStack{
            if  !env.isLoggedIn{
                logInView()
                
            }
            else{
                DecisionView()
            }
            Spacer()
        }
    }
}

