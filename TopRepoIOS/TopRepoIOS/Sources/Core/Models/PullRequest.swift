//
//  PullRequest.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation

public struct PullRequest : Equatable{
    var name:String
        var title:String
        var authorName:String
        var authorProfilePictureUrl: String
        var date:Date?
        var body:String
}
