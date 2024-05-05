//
//  City.swift
//  Guidebook
//
//  Created by Hiren Gandhi on 4/12/24.
//

import Foundation

struct City: Identifiable, Decodable{
    
    let id = UUID()
    var name: String
    var summary:String
    var imageName: String
    var attractions: [Attraction]
    
}
