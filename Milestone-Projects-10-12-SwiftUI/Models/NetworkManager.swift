//
//  NetworkManager.swift
//  Milestone-Projects-10-12-SwiftUI
//
//  Created by Baris Karalar on 15.07.2021.
//

import Foundation
import SwiftUI
import CoreData

class NetworkManager: ObservableObject {
    
    @Published var users = [User]()
    
    @Environment(\.managedObjectContext) var moc

    
    func fetchFromJson() {
        print("a")
        if let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                print("b")
                if error == nil {
                    let decoder = JSONDecoder()
                    if let data = data {
                        do {
                            let decodedData = try decoder.decode([User].self, from: data)
                            DispatchQueue.main.async {
                                print("c")
                                self.users = decodedData
                                self.setFetchedDataToCoreData()
                                print("d")
                            }
                        } catch  {
                            print(error.localizedDescription)
                        }
                        
                    }
                }
            }
            task.resume()
        }
        
        
    }
    
    func fetchData() {
        //if coredata object does not exist
        fetchFromJson()
        
        //else if coredata exist
        // load from coredata
//        setFetchedDataToCoreData()
    
    }
    
    func setFetchedDataToCoreData() {
        for user in users {
            addUser(user: user)

        }
       
    }
    
    func addUser(user: User) {
        let newUser = UserCD(context: moc)
        newUser.id = user.id
        newUser.age = Int16(user.age)
        newUser.company = user.company
        newUser.name = user.name
        do {
            try moc.save()
        } catch {
            print("Error is: \(error.localizedDescription)")
        }
    }
    
    
}
