//
//  Food.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import Foundation

// MARK: - Food
struct Food: Decodable {
    let dishes: [Dish]
}

// MARK: - Dish
struct Dish: Decodable, Identifiable {
    let id: Int
    let name: String
    let price, weight: Int
    let description: String
    let imageURL: String
    let tegs: [Teg]

    enum CodingKeys: String, CodingKey {
        case id, name, price, weight, description
        case imageURL = "image_url"
        case tegs
    }
}

enum Teg: String, CaseIterable, Decodable {
    case всеМеню = "Все меню"
    case сРисом = "С рисом"
    case сРыбой = "С рыбой"
    case салаты = "Салаты"
}
