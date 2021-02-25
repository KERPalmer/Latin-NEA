//
//  LatinApp.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//

import SwiftUI
import SQLite3
//The begining of the program where it starts.....
//THERE ARE SOME PREVIEWS FOR SOME STRUCTS AND NOT FOR OTHERS. THIS IS BECAUSE SOME REQUIRE THE ENVIROMENT OBJECT
//THIS WOULD SO INTENSE TO BUILD THAT YOU MIGHT AS WELL USE THE SIMULATOR
@main

struct LatinApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Data()) //sets up the enviroment for the program
        }
    }
}

struct LatinApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
