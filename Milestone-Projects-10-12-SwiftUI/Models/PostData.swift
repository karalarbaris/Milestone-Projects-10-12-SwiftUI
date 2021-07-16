//
//  PostData.swift
//  Milestone-Projects-10-12-SwiftUI
//
//  Created by Baris Karalar on 15.07.2021.
//

import Foundation

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var age: Int
    var company: String
    
    var friends: [Friend]
    
    struct Friend: Codable, Identifiable {
        var id: String
        var name: String
    }
}
