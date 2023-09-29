//
//  HomeRowView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 17.08.2023.
//

import SwiftUI

struct HomeRowView: View {
    
    @State private var isPresented = false
    let category: Category
    
    private let width = UIScreen.main.bounds.width - 32
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            MealRemoteImage(urlString: category.imageURL)
                .frame(height: 140)
                .cornerRadius(20)
                
            Text(category.name)
            .font(.system(size: 20, weight: .medium))
            .frame(width: width * 0.6, alignment: .leading)
            .padding()
            .lineLimit(2)
        }
    }
}

struct HomeRowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRowView(category: MockData.sampleCategory)
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .frame(width: 60)
            .shadow(color: .black.opacity(0.5), radius: 3, x: 1, y: 2)
    }
}

extension TextField {
    func bordered() -> some View {
        modifier(BorderedViewModifier())
    }
}
