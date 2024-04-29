//
//  ListRepositoryPresenter.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
protocol ListRepositoryPresenter : BasePresenter {
    
    func showRepositories(repositories: [Repo])
}
