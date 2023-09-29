//
//  BasketRowView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

struct BasketRowView: View {
    
    @ObservedObject var order: Order
    
    let dishItem: DishItem
    
    var body: some View {
        HStack {
            ZStack {
                Group {
                    Rectangle()
                        .frame(width: 62, height: 62)
                        .foregroundColor(Color(.systemGray6))
                        
                    MealRemoteImage(urlString: dishItem.dish.imageURL)
                        .frame(width: 56, height: 56)
                }
                .cornerRadius(6)
            }
            
            VStack(alignment: .leading) {
                Group {
                    Text(dishItem.dish.name)
                    HStack() {
                        Text("\(dishItem.dish.price) ₽")
                        Text("\(dishItem.dish.weight)г")
                            .foregroundColor(Color(.systemGray5))
                    }
                }
                .font(.system(size: 14, weight: .regular))
                .lineLimit(1)
            }
            Spacer()
            
            ZStack {
                Rectangle()
                    .frame(width: 100, height: 32)
                    .cornerRadius(10)
                    .foregroundColor(Color(.systemGray5))
                
                HStack() {
                    
                    Group {
                        Button(action: plusQuantity) {
                            Image(systemName: "plus")
                                
                        }

                        Text("\(dishItem.quantity)")
            
                        Button(action: minusQuantity) {
                            Image(systemName: "minus")
                        }
                    }
                    .frame(width: 25, height: 32)
                    .foregroundColor(.black)
                }
            }
        }
    }
    
    private func plusQuantity() {
        if dishItem.quantity < 10 {
            order.items[order.getIndex(dishItem)].quantity += 1
        }
    }
    
    private func minusQuantity() {
        guard dishItem.quantity > 1 else {
            let index = order.getIndex(order.items[order.getIndex(dishItem)])
            order.deleteItems(at: index)
            return
        }
        order.items[order.getIndex(dishItem)].quantity -= 1
    }
}

struct BasketRowView_Previews: PreviewProvider {
    static var previews: some View {
        BasketRowView(order: Order(), dishItem: DishItem(dish: MockData.sampleDish))
    }
}
