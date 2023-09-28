//
//  DishView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

struct DishView: View {
    
    @StateObject private var viewModel = DishViewModel()
    
    let title: String
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.dishes) { dish in
                            DishItemView(dish: dish)
                                .onTapGesture {
                                    viewModel.selectedDish = dish
                                    viewModel.isShowDetail = true
                                }
                        }
                    }
                }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .disabled(viewModel.isShowDetail)
            }
            .onAppear {
                viewModel.getDishes()
            }
            .blur(radius: viewModel.isShowDetail ? 20 : 0)
            
            if viewModel.isShowDetail {
                DetailView(
                    isShowingDetail: $viewModel.isShowDetail,
                    dish: viewModel.selectedDish ?? MockData.sampleDish
                )
            }
        }
    }
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(title: "Hello")
    }
}
