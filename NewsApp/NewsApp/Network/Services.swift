//
//  Services.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation

class Services {

    static let Shared = Services()

    init(){}

        func sendArticleRequest(urlString: String, completion: @escaping (Result<[Article], NetworkError>) -> ()) {

            guard let url = URL(string: urlString) else {
                completion(.failure(.badURL))
                return
            }

            ServiceManager.shared.fetchData(of: BaseResponse.self, url: url) { (result) in
                switch result {
                case .success(let news):
                    completion(.success(news.articles))
                case .failure(let error):
                    print(error)
                    completion(.failure(.notFound))
                }
            }
        }

    enum NetworkError: Error {
            case badURL
            case notFound
        }
    }
