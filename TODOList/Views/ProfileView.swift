//
//  ProfileView.swift
//  TODOList
//
//  Created by Rajesh Rajesh on 25/06/23.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    init() {
        
    }
    var body: some View {
        NavigationView {
            VStack {
                if let user =  viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                    
                    
                }
            }.navigationTitle("Profile")
        }.onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
        // Info : Name, email, Member
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }.padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }.padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }.padding()
        }
        // Sign Out
        Button("Log Out")  {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
        
        Spacer()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}