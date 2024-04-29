//
//  BaseInteractor.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
protocol BaseInteractor {
    
    func bind(presenter:BasePresenter)
    
    func start();
    
    func destroy();
    
}
