//
//  ListPRPresenter.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation
protocol ListPRPresenter : BasePresenter{
    func showPullRequestList(pullRequestList: [PullRequest])
}
