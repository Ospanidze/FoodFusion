//
//  IconButtonView.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

struct IconButtonView: View {
    
    let imageName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Rectangle()
                    .frame(width: 40, height: 40)
                    .cornerRadius(6)
                    .foregroundColor(.white)
                Image(systemName: imageName)
                    .imageScale(.medium)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }
    }
}

struct IconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        IconButtonView(imageName: "xmark", action: {})
    }
}
