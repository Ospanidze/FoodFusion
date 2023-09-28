//
//  HomeViewModel.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var categories: [Category] = []
    @Published var isShowingDishView = false
    @Published var title: String?
    
    func getCategories() {
        NetworkManager.shared.fetch(Meal.self, from: Link.meal.url) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let model):
                        self?.categories = model.сategories
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
        }
    }
}

