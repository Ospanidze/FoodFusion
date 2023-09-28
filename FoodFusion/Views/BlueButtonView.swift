//
//  BlueButtonView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

struct BlueButtonView: View {
    let action: () -> Void
    let title: LocalizedStringKey
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(width: UIScreen.main.bounds.width - 64, height: 48)
                .foregroundColor(.white)
                .background(Color(.systemBlue))
                .cornerRadius(10)
        }
    }
}

struct BlueButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BlueButtonView(action: {}, title: "Добавить в корзину")
    }
}
