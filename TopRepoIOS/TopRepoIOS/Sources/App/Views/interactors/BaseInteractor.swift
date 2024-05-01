//
//  BaseInteractor.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
protocol BaseInteractor {
    
    associatedtype Param
    associatedtype Presenter

    func start(_ params: Param?, with: Presenter);
    
}
