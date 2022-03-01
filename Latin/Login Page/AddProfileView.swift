//
//  AddProfileView.swift
//  Latin
//
//  Created by Kenan Palmer on 09/03/2021.
//

import SwiftUI

struct AddProfileView: View {
    @EnvironmentObject var env: Data
    @State var username: String = ""
    @State var password: String = ""
    @State var invalid: Bool = false
    @State var created = false
    var body: some View {
        VStack{
            Spacer()
            if invalid{
                Text("The username is either invalid or taken please use another").background(Color.red)
            }
            Text("Create a new user")
            Spacer()
            TextField("Username" ,text: $username)
            TextField("Password", text: $password)
            Button("Create"){
                let NSUsername:NSString = username as NSString
                let NSPassword:NSString = password as NSString
                if (env.db!.CheckUsername(Username: NSUsername)){
                    invalid = true
                }else{
                    let profile: Profile = Profile(id: -1, Username: NSUsername, Password: NSPassword)
                    do{
                        try env.db!.insertProfile(profile: profile, insertSQL: Profile.insertStatement)
                        created = true
                        invalid = false
                    }catch{
                        print("unable to create new profile")
                    }
                }
            }
            if created{
                Text("profile created").background(Color.green)
            }
            Spacer()
        }
    }
}

struct AddProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AddProfileView()
    }
}
