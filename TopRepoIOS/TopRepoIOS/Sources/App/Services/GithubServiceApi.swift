//
//  GithubServiceApi.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation
import RxSwift
import Alamofire
class GithubServiceApi: GitApiServiceProtocol{
    
    
    
    static let baseUrl = "api.github.com"
    
    func listAllRepositories(page: Int, searchQuery: SearchQuery?) -> Observable<[Repo]> {
        return listRepositories(searchQuery, page: page).map { response in
            response.items.map { item in
                item.parse()
            }
        }
    }
    
    func listPullRequests(repo: Repo) -> Observable<[PullRequest]> {
        return listAllPullrequests(repo).map { response in
            response?.map({ pullRequest in
                pullRequest.parse()                
            }) ?? []
        }
    }
    
    func listRepositories(_ searchQuery: SearchQuery?, page:Int) -> Observable<ListRepoResponse> {
        
        let lang = searchQuery?.languages?.description ?? ""
        let sort = searchQuery?.sortBy?.description ?? ""
        
        let queryParams = [
            URLQueryItem(name: "q", value: "language:\(lang)"),
            URLQueryItem(name: "sort", value: sort)
        ]
        let url = self.buildUrl(path: "/search/repositories", queryItems: queryParams)
        
        return GithubServiceApi.request(url:url?.absoluteString ?? "")
    }
    
    func listAllPullrequests(_ repo: Repo) -> Observable<[PullRequestResponse]?> {
        let url = self.buildUrl(path: "/repos/\(repo.authorName)/\(repo.name)/pulls")
        return GithubServiceApi.request(url: url?.absoluteString ?? "")
    }
    
    
    func buildUrl(path: String,queryItems: [URLQueryItem]? = nil) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = GithubServiceApi.baseUrl
        components.path = path
        components.queryItems = queryItems
        let url = components.url
        return url
    }
    
    
    private static func request<T: Codable> (url : String , httpMethod : HTTPMethod = .get,
                                             parameters: Parameters? = nil,
                                             encoding: ParameterEncoding = URLEncoding.default,
                                             headers: HTTPHeaders? = nil ) -> Observable<T> {
        return Observable<T>.create { observer in
            
            let request = AF.request(url, method: .get, parameters: parameters , encoding: encoding, headers: headers).responseDecodable(of: T.self) { response in
                
                switch response.result {
                    
                case .success(let value):
                    observer.onNext(value)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                request.cancel()
            }
     
        }
    }
    
}
