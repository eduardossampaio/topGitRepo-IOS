//
//  BasePresenter.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
protocol BasePresenter {
    
    func showLoading();
    
    func hideLoading();
    
    func showError();
}
