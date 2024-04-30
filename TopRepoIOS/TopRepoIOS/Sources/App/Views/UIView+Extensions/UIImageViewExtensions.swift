//
//  UIImageViewExtensions.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import UIKit
extension UIImageView {
    
    func downloadImage(from url: String, onSuccess: @escaping(UIImage)-> Void){
        let _url = URL(string: url)!

            if let data = try? Data(contentsOf: _url) {
                if let newImage = UIImage(data: data){
                    image = newImage
                    onSuccess(newImage)
                }
            }
    }
}
