//
//  SplashViewModel.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation

struct SplashViewModel {
    func setupData(){
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=fcc9c8c235b443cfaecb60d5983a14e7"
        Services.Shared.sendArticleRequest(urlString: urlString) { result in
            switch result {
            case .success(let articles):
                ArticleData.Shared.articles = articles
            case .failure(let error):
                print(error)
            }
        }
    }
}
