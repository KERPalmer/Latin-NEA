//
//  logInView.swift
//  Profile sql
//
//  Created by Kenan Palmer on 07/11/2020.
//

import SwiftUI
import SQLite3
struct logInView: View {
    @EnvironmentObject var env:Data
    @State private var Username:String = ""
    @State private var Password:String = ""
    @State private var inncorrect:Bool=false
    var body: some View {
        VStack{
            Text("Login Page")
            TextField("Username", text: $Username)
                .padding()
            TextField("Password", text: $Password)
                .padding()
            Button("log in"){
                if env.db?.CheckPassword(Username: Username as NSString, Password: Password as NSString) == true{
                    do{
                        print("correct username and password")
                        try env.profileID = (env.db?.SetCurrentUserID(username: Username as NSString))!
                    }catch{
                        print("set id error")
                    }
                    
                    env.isLoggedIn.toggle()
                }
                else{
                    print("incorrect username or password")
                    inncorrect=true
                }
            }
            if inncorrect{
                Text("The password was inncorrect")
                    .background(Color.red)
                    .opacity(0.8)
            }
        }
    }
}

struct logInView_Previews: PreviewProvider {
    static var previews: some View {
        logInView()
    }
}
