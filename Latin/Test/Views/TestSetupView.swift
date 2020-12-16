//
//  TestSetupView.swift
//  Latin
//
//  Created by Kenan Palmer on 10/12/2020.
//

import SwiftUI

struct TestSetupView: View {
    @EnvironmentObject var env:Data
    
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: SettingsView()){
                    Text("settings")
                        .bold()
                }
            }
        }
    }
}

struct TestSetupView_Previews: PreviewProvider {
    static var previews: some View {
        TestSetupView()
    }
}
