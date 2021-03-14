//
//  logInView.swift
//  Profile sql
//
//  Created by Kenan Palmer on 07/11/2020.
//

import SwiftUI
import SQLite3
//The Login page. User will enter username and password and then it will call on the database to make sure they are correct.
struct logInView: View {
    @EnvironmentObject var env:Data
    @State private var Username:String = ""
    @State private var Password:String = ""
    @State private var inncorrect:Bool=false
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    Text("Login Page")
                    Spacer()
                    NavigationLink(destination: AddProfileView()){
                        Image(systemName: "person.badge.plus")
                    }
                }
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
                        print("logging into profile id \(env.profileID)")
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
                Spacer()
            }
        }
    }
}

struct logInView_Previews: PreviewProvider {
    static var previews: some View {
        logInView()
    }
}
