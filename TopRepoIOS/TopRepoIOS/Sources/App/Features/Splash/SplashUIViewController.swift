//
//  SplashUIViewController.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
//SplashUIViewController
import UIKit
import Lottie
class SplashUIViewController: UIViewController{
    

    private lazy var loadingView: AnimationView = {
        let animationView:AnimationView = .init(name: "loading_animation")
        
        animationView.frame = view.bounds
        
         animationView.contentMode = .scaleAspectFit
         animationView.loopMode = .loop
            
        
        return animationView
    }()

    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white        
        view.addSubview(loadingView)
        loadingView.play(completion: { _ in
      
        })
    }
}
