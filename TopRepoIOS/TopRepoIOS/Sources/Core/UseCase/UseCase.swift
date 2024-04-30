//
//  UseCase.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import RxSwift

protocol UseCase {
    associatedtype Param
    associatedtype Result
    
    func start(params: Param) -> Observable<Result>

}
