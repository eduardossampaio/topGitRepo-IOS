//
//  UseCase.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
protocol UseCaseProtocol {
    
    associatedtype T
    
    func start (params:T?);

    func finish();
}

class UseCase<T> : UseCaseProtocol{
    func start(params: T?) {
        
    }
    
    func finish() {

    }
    
    
}
