//
//  ContentView.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Background()
                VStack(alignment: .center){
                    Spacer()
                    NavigationLink(destination: DecisionView()){
                        Text("GCSE")
                            .font(.system(size: 100))
                            .foregroundColor(.black)
                            .bold()
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(20)
                            .opacity(0.8)
                    }
                    Spacer()
                    NavigationLink(destination: Text("work in progress")){
                        Text("Alevel")
                            .font(.system(size: 100))
                            .foregroundColor(.black)
                            .bold()
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(20)
                            .opacity(0.8)
                        
                    }
                    Spacer()
                    Spacer()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
