//
//  NetworkManager.swift
//  ECommerce
//
//  Created by rahul kaushik on 16/07/23.
//

import Foundation

class NetworkManager : ObservableObject{
    @Published var products = [Product]()
    func fetchData() {
        if let url = URL(string: "https://fakestoreapi.com/products") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, urlResponse, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([Product].self, from: safeData)
                            DispatchQueue.main.async {
                                self.products = results
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
