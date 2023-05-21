//
//  Cat.swift
//  CatsApp
//
//  Created by Felipe Aragon on 21/05/23.
//

import Foundation

struct Cat: Codable {
    var id: String
    var breedName: String
    var origin: String
    var affectionLevel: Int
    var intelligence: Int
    var imageId: String
    var imageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case id, origin, intelligence
        case breedName = "name"
        case affectionLevel = "affection_level"
        case imageId = "reference_image_id"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = (try? container.decode(String.self, forKey: .id)) ?? ""
        breedName = (try? container.decode(String.self, forKey: .breedName)) ?? ""
        origin = (try? container.decode(String.self, forKey: .origin)) ?? ""
        affectionLevel = (try? container.decode(Int.self, forKey: .affectionLevel)) ?? 0
        intelligence = (try? container.decode(Int.self, forKey: .intelligence)) ?? 0
        imageId = (try? container.decode(String.self, forKey: .imageId)) ?? ""
        imageUrl = "https://cdn2.thecatapi.com/images/\(imageId).jpg"
    }
}
