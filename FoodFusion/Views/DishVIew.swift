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
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(Teg.allCases, id: \.self) { item in
                            ButtonTegView(
                                action: {viewModel.filterDishes(item: item)},
                                title: item.rawValue)
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.leading, 12)
                
                Spacer(minLength: 20)
                
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.displayedDishes) { dish in
                            DishItemView(dish: dish)
                                .onTapGesture {
                                    viewModel.selectedDish = dish
                                    viewModel.isShowDetail.toggle()
                                }
                        }
                    }
                }
            }
            .disabled(viewModel.isShowDetail)
            .onAppear {
                viewModel.getDishes()
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .blur(radius: viewModel.isShowDetail ? 20 : 0)
            
           
            VStack {
                if viewModel.isShowDetail {
                    DetailView(
                        isShowingDetail: $viewModel.isShowDetail,
                        dish: viewModel.selectedDish ?? MockData.sampleDish
                    )
                    .transition(.scale)
                }
            }
        }
       .animation(.spring(), value: viewModel.isShowDetail)
    }
       
}

struct DishView_Previews: PreviewProvider {
    static var previews: some View {
        DishView(title: "Hello")
    }
}
