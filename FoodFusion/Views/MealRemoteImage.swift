//
//  MealRemoteImage.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder")
    }
}

struct MealRemoteImage: View {
    
    @StateObject private var imageLoader = ImageLoaderModel()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(from: urlString) }
    }
}

struct AppetizerRemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        MealRemoteImage(urlString: "")
    }
}
