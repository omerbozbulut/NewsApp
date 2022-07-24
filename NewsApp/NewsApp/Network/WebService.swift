//
//  Services.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Alamofire

protocol ServiceProtocol {
    func fetchNews(onSuccess: @escaping (BaseResponse) -> (), onError: @escaping (AFError) -> ())
}

final class WebService: ServiceProtocol {
    func fetchNews(onSuccess: @escaping (BaseResponse) -> (), onError: @escaping (AFError) -> ()) {
        ServiceManager.shared.fetch(path: Constants.ServiceEndPoint.newsServiceEndPoint()) { response in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
