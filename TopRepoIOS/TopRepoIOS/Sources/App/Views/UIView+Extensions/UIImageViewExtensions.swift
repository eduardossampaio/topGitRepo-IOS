//
//  UIImageViewExtensions.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import UIKit
extension UIImageView {
    
    func downloadImage(from stringUrl: String, onSuccess: @escaping(UIImage)-> Void){        
        
        if let url = URL(string: stringUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
                self.maskCircle(anyImage: self.image)
              }
            }.resume()
          }
    }
}
