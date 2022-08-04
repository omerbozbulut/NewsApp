//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation

protocol ArticleInputProtocol{
    func fetchArticles(category: String?, searchText: String?, completion: @escaping ((Bool) -> Void))
    func favoriteProcess(_ row: Int)
    func articleUpdateFavorite()
    var articles: [Article] { get set }
}

protocol ArticleOutputProtocol {
    func refresh()
}

class NewsViewModel: ArticleInputProtocol {
    var outputProtocol: ArticleOutputProtocol?
    var service: ServiceProtocol
    var articles =  [Article]()
    
    init(_ service: ServiceProtocol){
        self.service = service
    }

    func fetchArticles(category: String?, searchText: String?, completion: @escaping ((Bool) -> Void)) {
        service.fetchNews(category: category, searchText: searchText) { data in
            self.articles = data.articles
            completion(true)
        } onError: { error in
            completion(false)
            print(error)
        }
    }

    func favoriteProcess(_ row: Int){
        var favoriteNews = FavoriteService.shared.getFavoriteList()
        let news = articles[row]

        if !news.isFavorite {
            if !favoriteNews.contains(where: {$0.title == news.title} ) {
                articles[row].isFavorite = true
                favoriteNews.append(news)
            }
            FavoriteService.shared.setUserDefaults(favoriteNews)
            outputProtocol?.refresh()
        }
        else {
            for (index, element) in favoriteNews.enumerated() {
                if element.title == news.title {
                    favoriteNews.remove(at: index)
                    FavoriteService.shared.setUserDefaults(favoriteNews)
                    articles[row].isFavorite = false
                }
            }
            outputProtocol?.refresh()
        }
    }

    func articleUpdateFavorite() {
        let favoriteNews = FavoriteService.shared.getFavoriteList()

        for (index, element) in articles.enumerated() {
            for news in favoriteNews {
                if element.title == news.title {
                    articles[index].isFavorite = true
                    break
                }
                else {
                    articles[index].isFavorite = false
                }
            }
        }
    }
}

