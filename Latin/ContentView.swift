//
//  ContentView.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().padding().environmentObject(Data())
    }
}
