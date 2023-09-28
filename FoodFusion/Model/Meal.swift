//
//  Meal.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 18.08.2023.
//

import Foundation

struct Meal: Decodable {
    let сategories: [Category]
}

struct Category: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image_url"
    }
}

struct MockData {
    
    static let sampleCategory = Category(
        id: 1,
        name: "Пекарни и кондитерские",
        imageURL: "asianSteak"
    )
    
    static let сategories = [sampleCategory, sampleCategory, sampleCategory]
    
    static let sampleDish = Dish(
        id: 1,
        name: "Рис с овощами",
        price: 123,
        weight: 312,
        description: "dasdfjghaghal",
        imageURL: "asianSteak",
        tegs: []
    )
    
    static let dishes = [sampleDish, sampleDish, sampleDish]
}
