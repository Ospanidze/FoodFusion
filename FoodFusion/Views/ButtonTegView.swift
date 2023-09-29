//
//  ButtonTegView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 29.09.2023.
//

import SwiftUI

struct ButtonTegView: View {
    
    let action: () -> Void
    let title: String
    
    var body: some View {
        
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .fontWeight(.semibold)
                .frame(width: 94, height: 35)
                .foregroundColor(.black)
                .background(Color(.systemGray6))
                .cornerRadius(10)
        }
    }
}

struct ButtonTegView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTegView(action: {}, title: "dasds")
    }
}
