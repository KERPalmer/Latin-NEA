//
//  LatinApp.swift
//  Latin
//
//  Created by Kenan Palmer on 05/10/2020.
//
//The begining of the program where it starts.....
//THERE ARE SOME PREVIEWS FOR SOME STRUCTS AND NOT FOR OTHERS. THIS IS BECAUSE SOME REQUIRE THE ENVIROMENT OBJECT
//THIS WOULD SO INTENSE TO BUILD THAT YOU MIGHT AS WELL USE THE SIMULATOR

import SwiftUI
import SQLite3
@main

struct LatinApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Data()) //sets up the enviroment for the program
        }
    }
}   
