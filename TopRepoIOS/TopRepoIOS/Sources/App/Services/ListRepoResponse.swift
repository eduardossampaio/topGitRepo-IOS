//
//  ListRepoResponse.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation

struct ListRepoResponse : Codable{
    var total_count: Int
    var incomplete_results: Bool
    var items: [ListRepoResponseItem]
}


struct ListRepoResponseItem : Codable{
    var id: Int
    var name: String?
    var full_name:String?
    var description:String?
    var owner: Owner?
    var stargazers_count:Int?
    var forks_count:Int?
    
}
struct Owner: Codable{
    var login: String?
    var id: Int?
    var avatar_url: String?
}

extension ListRepoResponseItem{
    func parse() ->Repo{        
        return Repo(
            id: id,
            name: name ?? "",
            description: description ?? "",
            authorName: owner?.login ?? "",
            authorProfilePictureUrl: owner?.avatar_url ?? "",
            starCount: stargazers_count ?? 0,
            forkCount: forks_count ?? 0)
    }
}
