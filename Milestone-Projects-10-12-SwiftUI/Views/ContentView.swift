//
//  ContentView.swift
//  Milestone-Projects-10-12-SwiftUI
//
//  Created by Baris Karalar on 15.07.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    @FetchRequest(entity: UserCD.entity(), sortDescriptors: []) var users: FetchedResults<UserCD>
    
    var body: some View {
        
        NavigationView {
//            List(networkManager.users) { user in
//                NavigationLink(destination: DetailView(users: networkManager.users, selectedUser: user)) {
//                    HStack {
//                        Text(user.name)
////                        Text(user.friends[0].name)
//                    }
//                }
//
//            }
            Text("\(users.count)")
            List(users) { user in
                HStack {
                    
                    Text(user.name ?? "dsdfg")
                }
            }
            
            
        }
        .onAppear(perform: {
            print("1. onAppear inside contentview")
            networkManager.fetchData()
        })
        
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
