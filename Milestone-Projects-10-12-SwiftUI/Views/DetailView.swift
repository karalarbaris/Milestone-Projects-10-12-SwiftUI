//
//  DetailView.swift
//  Milestone-Projects-10-12-SwiftUI
//
//  Created by Baris Karalar on 16.07.2021.
//

import SwiftUI

struct DetailView: View {
    
    
    
    var selectedUser : User
    var users : [User]
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Company Name")
            Text(selectedUser.company)
                .padding()
            Text("Friends")
                .font(.headline)
            List(users) { userFriend in
                
                NavigationLink(destination: FriendDetailView(user: userFriend)) {
                    Text(userFriend.name)
                        .font(.footnote)
                    Text(userFriend.company)
                }
               
            }
        }
        
    }
    
    init(users: [User], selectedUser: User) {
        self.selectedUser = selectedUser
        var matches = [User]()
        
        for friend in selectedUser.friends {
            if let match = users.first(where: { $0.id == friend.id}) {
                matches.append(match)
            } else {
                fatalError("missing \(friend)")
            }
        }
        
        self.users = matches
    }
    
}

