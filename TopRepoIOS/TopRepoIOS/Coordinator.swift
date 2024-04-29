//
//  Coordinator.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import UIKit
protocol Coordinator {
    
    var navigationController: UINavigationController { get set }
    func start()
    
}
