//
//  BaseUIVIewController.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
import UIKit
import Lottie

class BaseUIVIewController : UIViewController, BasePresenter {
    
    
    private lazy var loadingView: AnimationView = {
        let animationView:AnimationView = .init(name: "loading_animation")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        return animationView
    }()
    
    private lazy var errorView: AnimationView = {
        let animationView:AnimationView = .init(name: "error_animation")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        return animationView
    }()
    
    override func viewDidLoad() {
        view.addSubview(loadingView)
        view.addSubview(errorView)
    }
    
    func showLoading() {
        errorView.isHidden = true
        loadingView.isHidden = false
        loadingView.play()
    }
    
    func hideLoading() {
        loadingView.stop()
        loadingView.isHidden = true
        errorView.isHidden = true
    }
    
    func showError() {
        loadingView.isHidden = true
        errorView.isHidden = false
        errorView.play()
    }
    
    
    
}
