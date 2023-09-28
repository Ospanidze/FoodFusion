//
//  ImageLoaderModel.swift
//  FoodFusion
//
//  Created by Айдар Оспанов on 28.09.2023.
//

import SwiftUI

final class ImageLoaderModel: ObservableObject {
    
    @Published var image: Image?
    
    func load(from urlString: String) {
        NetworkManager.shared.fetchImage(from: urlString) { result in
            switch result {
            case .success(let imageData):
                let uiImage = UIImage(data: imageData)
                guard let uiImage = uiImage else { return }
                self.image = Image(uiImage: uiImage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
