//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Alamofire

protocol ArticleViewModelProtocol{
    func fetchArticles(onSuccess: @escaping (BaseResponse?) -> Void, onError: @escaping (AFError) -> Void)
    var articles: [Article] { get set }
    var searchData: [Article] { get set }
}

class NewsViewModel: ArticleViewModelProtocol {
    var service: ServiceProtocol
    var articles =  [Article]()
    var searchData = [Article]()

    init(_ service: ServiceProtocol){
        self.service = service
    }

    func fetchArticles(onSuccess: @escaping (BaseResponse?) -> Void, onError: @escaping (AFError) -> Void) {
        service.fetchNews { data in
            onSuccess(data)
        } onError: { error in
            onError(error)
        }
    }
}

