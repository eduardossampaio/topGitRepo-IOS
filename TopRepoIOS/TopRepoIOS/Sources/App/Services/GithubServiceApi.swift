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
    func listAllRepositories(page: Int, searchQuery: SearchQuery?) -> Observable<[Repo]> {
        return GithubServiceApi.getPosts().map { response in
            response.items.map { item in
                item.parse()
            }
        }
    }
    
    static func getPosts() -> Observable<ListRepoResponse> {
        return GithubServiceApi.request(url: "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=0")
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
