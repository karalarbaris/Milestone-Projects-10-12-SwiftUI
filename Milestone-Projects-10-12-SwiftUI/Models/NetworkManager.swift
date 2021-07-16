//
//  NetworkManager.swift
//  Milestone-Projects-10-12-SwiftUI
//
//  Created by Baris Karalar on 15.07.2021.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var users = [User]()
    
    func fetchData() {
        
        if let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let data = data {
                        do {
                            let decodedData = try decoder.decode([User].self, from: data)
                            DispatchQueue.main.async {
                                self.users = decodedData
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
}
