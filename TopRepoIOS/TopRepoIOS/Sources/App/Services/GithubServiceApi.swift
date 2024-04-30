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
    
    static let baseUrl = "https://api.github.com"
    
    func listAllRepositories(page: Int, searchQuery: SearchQuery?) -> Observable<[Repo]> {
        return GithubServiceApi.listRepositories(searchQuery, page: page).map { response in
            response.items.map { item in
                item.parse()
            }
        }
    }
    
    static func listRepositories(_ searchQuery: SearchQuery?, page:Int) -> Observable<ListRepoResponse> {
        
        let lang = searchQuery?.languages?.description ?? ""
        let sort = searchQuery?.sortBy?.description ?? ""
        
        let url = "\(baseUrl)/search/repositories?q=language:\(lang)&sort=\(sort)&page=\(page)"        
        
        return GithubServiceApi.request(url:url)
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
