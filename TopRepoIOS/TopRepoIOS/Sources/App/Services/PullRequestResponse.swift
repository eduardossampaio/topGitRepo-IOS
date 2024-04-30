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
    var repoItem: RepoItem?
    var user: UserItem?
}


struct RepoItem : Codable{
    var name: String
}

struct UserItem: Codable{
    var name: String?
    var avatar_url: String?
}
//data class UserItem(
//    @JsonProperty("login")
//    val name: String?,
//
//    @JsonProperty("avatar_url")
//    val avatarUrl: String?,
//)

//@JsonIgnoreProperties(ignoreUnknown = true)
//data class RepoItem(
//    @JsonProperty("name")
//    val name: String?
//)

//@JsonProperty("id")

//
//   @JsonProperty("repo")
//   val repoItem: RepoItem?,
//
//   @JsonProperty("user")
//   val user: UserItem?,
//
//
//   @JsonProperty("created_at")
//   val createdAt: Date,


extension PullRequestResponse {
    func parse() ->PullRequest{
//        return Repo(
//            id: id,
//            name: name ?? "",
//            description: description ?? "",
//            authorName: owner?.login ?? "",
//            authorProfilePictureUrl: owner?.avatar_url ?? "",
//            starCount: stargazers_count ?? 0,
//            forkCount: forks_count ?? 0)
        
        return PullRequest(
            name: repoItem?.name ?? "",
            title: title ?? "",
            authorName: user?.name ?? "",
            authorProfilePictureUrl: user?.avatar_url ?? "",
            date: Date(),
            body: body ?? "")
    }
}
