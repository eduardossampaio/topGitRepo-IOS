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
    var created_at: String?
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
            date: created_at?.toDate(),
            body: body ?? "")
    }
}


extension String {

    func toDate(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ss'Z'")-> Date?{

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)

        return date

    }
}

extension Date {

    func toString(withFormat format: String = "dd/MM/yyyy") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
