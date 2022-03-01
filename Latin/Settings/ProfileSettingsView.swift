//
//  SwiftUIView.swift
//  Latin
//
//  Created by Kenan Palmer on 22/03/2021.
//
import SwiftUI

struct ProfileSettingsView: View {
    var body: some View {
        NavigationView{
        List{
            NavigationLink(destination: ResetUsername()){
                Text("Reset username")
            }
            NavigationLink(destination: ResetPassword()){
                Text("Reset password")
            }
            NavigationLink(destination: ResetProgress()){
               Text("reset progress")
            }
            NavigationLink(destination: DeleteAccount()){
                Text("delete account")
            }
            NavigationLink(destination: LogOutView()){
                    Text("Log out")
            }
        }
    }
    }
}
struct ResetUsername: View{
    @EnvironmentObject var env : Data
    @State var username:String = ""
    @State var invalid = false
    var body: some View{
        VStack{
            Text("Are you sure you want to reset your username").bold()
            Text("Your username is currently: \(env.profileUsername)").bold()
            TextField("new username", text: $username)
            Button("reset username"){
                let NSUsername = username as NSString
                invalid = false
                if (env.db!.CheckUsername(Username: NSUsername)){
                    invalid = true
                }
                if !invalid{
                        let updated = env.db?.UpdateUsername(profile_id: env.profileID, username: username)
                        if updated! {
                            print("username updated to \(username)")
                            env.profileUsername = username
                        }else{
                            print("username failed to update to \(username)")
                        }
                    }
                else{
                    print("invalid username")
                }
            }
            if invalid{
                Text("That username is already taken or invalid")
            }
        }
    }
}
struct ResetPassword: View{
    @EnvironmentObject var env : Data
    @State var password:String = ""
    var body: some View{
        VStack{
            Text("Are you sure you want to reset your password").bold()
            Text("Your password is currently: \(env.profilePassword)").bold()
            TextField("new password", text: $password)
            Button("reset password"){
                let updated = env.db?.UpdatePassword(profile_id: env.profileID, password:password)
                if updated! {
                    print("password updated to \(password)")
                    env.profilePassword = password
                }else{
                    print("password failed to update to \(password)")
                }
            }
        }
    }
}

struct ResetProgress: View{
    @EnvironmentObject var env : Data
    var body: some View{
        VStack{
            Text("Are you sure you want to reset your progress").bold()
            Text("Once done you cannot undo this").bold()
            Button("reset progress"){
                let deleted = env.db?.ResetProgress(profile_id: env.profileID)
                if deleted!{
                    print("successfully reset progress")
                }else{
                    print("failed to reset progress")
                }
            }
        }
    }
}
struct DeleteAccount: View{
    @EnvironmentObject var env : Data
    var body: some View{
        VStack{
            Text("Are you sure you want to delete your account").bold()
            Text("Once done you cannot undo this").bold()
            Button("delete account"){
                let deleted = env.db?.DeleteUser(profile_id: env.profileID)
                if deleted!{
                    print("delted profile")
                    env.logOut()
                }else{
                    print("failed to log out")
                }
            }
        }
    }
}
struct LogOutView:View{
    @EnvironmentObject var env : Data
    var body: some View{
        VStack{
            Button("Log out"){
                env.logOut()
            }
        }
    }
}

