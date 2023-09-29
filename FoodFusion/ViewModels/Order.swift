//
//  Order.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

struct DishItem {
    let dish: Dish
    var quantity = 1
}

final class Order: ObservableObject {
    
    @Published var items: [DishItem] = []
    
    var totalPrice: Int {
        items.reduce(0) { $0 + $1.dish.price * $1.quantity }
    }
    
    func add(_ dish: Dish) {
        
        if let index = items.firstIndex(where: { item in
            return dish.id == item.dish.id
        }) {
            items[index].quantity += 1
        } else {
            let dishItem = DishItem(dish: dish)
            items.append(dishItem)
        } 
    }
    
    func deleteItems(at index: Int) {
        items.remove(at: index)
    }
    
    func getIndex(_ dishItem: DishItem) -> Int {
        let index = items.firstIndex(where: { item in
            return dishItem.dish.id == item.dish.id
        }) ?? 0
        
        return index
    }
}
