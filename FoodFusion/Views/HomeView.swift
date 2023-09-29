//
//  HomeView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 17.08.2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        List(viewModel.categories) { category in
            NavigationLink(destination: DishView(title: category.name)) {
                HomeRowView(category: category)
            }
        }
//        .listRowSeparatorTint(.red)
//        .listRowSeparator(.hidden)
        .listStyle(.plain)
        .onAppear {
            viewModel.getCategories()
        }
        .navigationBarItems(
            leading: LeftNavView(imageName: "place", cityName: "Astana", date: "12 aug, 2023"),
            trailing: Image("girl")
                .resizable()
            
        )
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct LeftNavView: View {
    let imageName: String
    let cityName: String
    let date: String
    
    var body: some View {
        HStack {
            Image(imageName)
            VStack(alignment: .leading) {
                Text(cityName)
                    .font(.system(size: 16, weight: .heavy))
                
                Text(date)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.gray.opacity(0.8))
            }
        }
    }
}
