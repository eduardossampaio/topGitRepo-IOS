//
//  BaseInteractor.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
protocol IBaseInteractor {
    
    associatedtype T
    
    func bind(presenter:BasePresenter)
    
    func start(params: T);
    
    func destroy();
    
}

class BaseInteractor<T> : IBaseInteractor {
    func bind(presenter: BasePresenter) {
        
    }
    
    func start(params: T) {
        
    }
    
    func destroy() {
        
    }
    
    
}
