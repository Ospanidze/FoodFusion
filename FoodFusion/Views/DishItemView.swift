//
//  DishItemView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

struct DishItemView: View {
    
    let dish: Dish
    
    var body: some View {
        VStack(spacing: -2) {
            ZStack {
                Rectangle()
                    .frame(width: 109, height: 109)
                    .foregroundColor(Color(.systemGray6))
                    .cornerRadius(10)
                
                MealRemoteImage(urlString: dish.imageURL)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
            Text(dish.name)
                .font(.system(size: 14))
                .multilineTextAlignment(.center)
                //.lineLimit(2)
                .frame(width: 109, height: 60)
        }
    }
}

struct DishItemView_Previews: PreviewProvider {
    static var previews: some View {
        DishItemView(dish: MockData.sampleDish)
    }
}
