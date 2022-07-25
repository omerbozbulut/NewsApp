//
//  ServiceManager.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Alamofire

final class ServiceManager {
    static let shared = ServiceManager()

    func fetch<T: Codable>(path: String, onSuccess: @escaping (T) -> (), onError: (AFError) -> ()){
        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { response in
            guard let data = response.value else {
                print(response.error as Any)
                return
            }
            onSuccess(data)
        }
    }
}
