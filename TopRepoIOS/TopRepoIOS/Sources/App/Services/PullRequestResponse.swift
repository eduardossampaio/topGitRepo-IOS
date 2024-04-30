//
//  PullRequestResponse.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 30/04/24.
//

import Foundation

struct PullRequestResponse : Codable{
    var id: Int
    var title:String?
    var body:String?
    var repo: RepoItem?
    var user: UserItem?
}


struct RepoItem : Codable{
    var name: String?
}

struct UserItem: Codable{
    var login: String?
    var avatar_url: String?
}


extension PullRequestResponse {
    func parse() ->PullRequest{
        
        return PullRequest(
            name: repo?.name ?? "",
            title: title ?? "",
            authorName: user?.login ?? "",
            authorProfilePictureUrl: user?.avatar_url ?? "",
            date: Date(),
            body: body ?? "")
    }
}
