//
//  DishViewModel.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

final class DishViewModel: ObservableObject {
    
   
    @Published var displayedDishes: [Dish] = []
    @Published var isTapped = false
    @Published var isShowDetail = false
    @Published var selectedDish: Dish?
    private var dishes: [Dish] = []
    
    
    func filterDishes(item: Teg) {
        displayedDishes = dishes
        displayedDishes = dishes.filter { $0.tegs.contains(item) }
    }
    
    func getDishes() {
        NetworkManager.shared.fetch(Food.self, from: Link.food.url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let model):
                        self?.dishes = model.dishes
                        self?.displayedDishes = model.dishes
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }
}
