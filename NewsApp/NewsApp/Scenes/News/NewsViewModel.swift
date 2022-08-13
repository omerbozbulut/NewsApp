//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation

protocol ArticleInputProtocol{
    func fetchArticles(category: String?)
    func searchArticles(searchText: String, startingDate: String, endDate: String)
    func searchRequest(text: String?, startingDate: String, endDate: String)
    func favoriteProcess(_ row: Int)
    func articleUpdateFavorite()
    var articles: [Article] { get set }
}

class NewsViewModel: ArticleInputProtocol {
    var service: WebServiceProtocol
    var articles =  [Article]()

    var refreshData: (() -> Void)?
    var dataError: ((_ error: Error) -> Void)?

    init(_ service: WebServiceProtocol){
        self.service = service
    }

    func fetchArticles(category: String?) {
        service.fetchNews(category: category) { data in
            self.articles = data.articles
            self.articleUpdateFavorite()
            self.refreshData?()
        } onError: { error in
            self.dataError?(error)
        }
    }

    func searchArticles(searchText: String, startingDate: String, endDate: String) {
        service.fetchSearchNews(searchText: searchText, startingDate: startingDate, endDate: endDate) { data in
            self.articles = data.articles
            self.articleUpdateFavorite()
            self.refreshData?()
        } onError: { error in
            self.dataError?(error)
        }
    }

    func searchRequest(text: String?, startingDate: String, endDate: String) {
        if let textString = text, !textString.isEmpty {
            searchArticles(searchText: textString, startingDate: startingDate, endDate: endDate)
        } else {
            fetchArticles(category: nil)
        }
    }

    // add/remove favorite
    func favoriteProcess(_ row: Int){
        var favoriteNews = FavoriteService.shared.getFavoriteList()
        let news = articles[row]

        if !news.isFavorite {
            if !favoriteNews.contains(where: {$0.title == news.title} ) {
                articles[row].isFavorite = true
                favoriteNews.append(news)
            }
            FavoriteService.shared.setUserDefaults(favoriteNews)
            refreshData?()
        }
        else {
            for (index, element) in favoriteNews.enumerated() {
                if element.title == news.title {
                    favoriteNews.remove(at: index)
                    FavoriteService.shared.setUserDefaults(favoriteNews)
                    articles[row].isFavorite = false
                }
            }
            refreshData?()
        }
    }

    // isFavorite control
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
        refreshData?()
    }
}

