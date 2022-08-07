//
//  Services.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Alamofire

protocol ServiceProtocol {
    func fetchNews(category: String?, onSuccess: @escaping (BaseResponse) -> (), onError: @escaping (AFError) -> ())
    func fetchSearchNews(searchText: String, startingDate: String, endDate: String,  onSuccess: @escaping (BaseResponse) -> (), onError: @escaping (AFError) -> ())
}

final class WebService: ServiceProtocol {
    func fetchNews(category: String?, onSuccess: @escaping (BaseResponse) -> (), onError: @escaping (AFError) -> ()) {
        ServiceManager.shared.fetch(path: Constants.ServiceEndPoint.newsServiceEndPoint(category: category)) { response in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }

    func fetchSearchNews(searchText: String, startingDate: String, endDate: String, onSuccess: @escaping (BaseResponse) -> (), onError: @escaping (AFError) -> ()) {
        ServiceManager.shared.fetch(path: Constants.ServiceEndPoint.newsServiceSearchEndPoint(searchText: searchText, startingDate: startingDate, endDate: endDate)) { response in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
