//
//  File.swift
//  ECommerce
//
//  Created by rahul kaushik on 16/07/23.
//

import Foundation

//struct Root : Decodable {
//   let results: [Product]
//}

struct Product : Hashable,Codable{
    let id : Int
    let title : String
    let image : String
    let price : Float
    
}
