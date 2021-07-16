//
//  FriendDetailView.swift
//  Milestone-Projects-10-12-SwiftUI
//
//  Created by Baris Karalar on 17.07.2021.
//

import SwiftUI

struct FriendDetailView: View {
    
    var user: User
    
    var body: some View {
        VStack {
            Text(user.name)
                .font(.footnote)
            Text(user.company)
            Text("\(user.age)")
        }
    }
}

