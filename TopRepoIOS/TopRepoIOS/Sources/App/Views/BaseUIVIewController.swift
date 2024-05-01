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
        animationView.isHidden = true;
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.accessibilityIdentifier = "loadingView"
        
        return animationView
    }()
    
    private lazy var errorView: AnimationView = {
        let animationView:AnimationView = .init(name: "error_animation")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.isHidden = true;
        animationView.accessibilityIdentifier = "errorView"
        return animationView
    }()
    
    private lazy var emptyListView: AnimationView = {
        let animationView:AnimationView = .init(name: "empty_list")
        animationView.contentMode = .scaleAspectFit
        animationView.accessibilityIdentifier = "emptyListView"
        animationView.loopMode = .loop
        animationView.isHidden = true;
        return animationView
    }()
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor.white
        view.addSubview(loadingView)
        view.addSubview(errorView)
        view.addSubview(emptyListView)
        
        let margins = CGFloat(20)
        
        loadingView.anchor(top:view.topAnchor, left: view.leftAnchor,bottom:view.bottomAnchor, right: view.rightAnchor,paddingTop: margins,paddingLeft: margins, paddingBottom: margins,paddingRight: margins)
        
        errorView.anchor(top:view.topAnchor, left: view.leftAnchor,bottom:view.bottomAnchor, right: view.rightAnchor,paddingTop: margins,paddingLeft: margins, paddingBottom: margins,paddingRight: margins )
        
        emptyListView.anchor(top:view.topAnchor, left: view.leftAnchor,bottom:view.bottomAnchor, right: view.rightAnchor,paddingTop: margins,paddingLeft: margins, paddingBottom: margins,paddingRight: margins )
        
        showLoading()
    }
    
    func showLoading() {
        hideAll()
        view.bringSubviewToFront(loadingView)
        loadingView.isHidden = false
        loadingView.play()
    }
    
    func hideLoading() {
        hideAll()
    }
    
    func showError() {
        hideAll()
        view.bringSubviewToFront(errorView)
        errorView.isHidden = false
        errorView.play()
    }
    
    func showEmptyResult(){
        hideAll()
        view.bringSubviewToFront(emptyListView)
        emptyListView.isHidden = false
        emptyListView.play()
    }
    
    func hideAll(){
        loadingView.stop()
        loadingView.isHidden = true
        
        errorView.stop()
        errorView.isHidden = true
        
        emptyListView.stop()
        emptyListView.isHidden = true
    }
    
    
}
