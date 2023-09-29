//
//  DetailView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var isShowingDetail: Bool
    @EnvironmentObject private var order: Order
    
    let dish: Dish
    private let width = UIScreen.main.bounds.width - 32
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.white)
                .frame(height: width + 150)
                .cornerRadius(15)
            
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color(.systemGray6))
                            .frame(height: 200)
                            .cornerRadius(10)
                            .padding()
                        MealRemoteImage(urlString: dish.imageURL)
                            .frame(width: 170, height: 170)
                            .cornerRadius(10)
                    }
                    .overlay (
                        HStack(spacing: -10) {
                            Group {
                                IconButtonView(imageName: "heart", action: {})
                                IconButtonView(
                                    imageName: "xmark",
                                    action: { isShowingDetail.toggle() }
                                )
                            }
                            .padding(.top)
                            .padding(.trailing)
                        }
                            .padding()
                        ,
                        alignment: .topTrailing
                    )
                    
                    Group {
                        Text(dish.name)
                            .font(.system(size: 16, weight: .medium))
                        HStack {
                            Text("\(dish.price) ₽")
                            Text("\(dish.weight)г")
                                .foregroundColor(Color(.systemGray5))
                        }
                        .font(.system(size: 14))
                    }
                    .lineLimit(1)
                    .padding(.leading)
                    
                    Text(dish.description)
                        .font(.system(size: 14, weight: .regular))
                        .padding(.leading)
                        .frame(height: 130, alignment: .topLeading)
                }
                
                BlueButtonView(
                    action: {
                        order.add(dish)
                        isShowingDetail.toggle()
                    },
                    title: "Добавить в корзину"
                )
            }
        }
        .padding()
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(isShowingDetail: .constant(false), dish: MockData.sampleDish)
    }
}
