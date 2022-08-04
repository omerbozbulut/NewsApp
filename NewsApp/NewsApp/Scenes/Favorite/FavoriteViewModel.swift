//
//  FavoriteViewModel.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 2.08.2022.
//

import Foundation

final class FavoriteViewModel {

    var favoriteNews: [Article]

    init(_ favoriteList: [Article]){
        self.favoriteNews = favoriteList
    }

    func updateFavoriteList(){
        self.favoriteNews = FavoriteService.shared.getFavoriteList()
    }

    func removeFavorite(_ row: Int){
        updateFavoriteList()
        favoriteNews.remove(at: row)
        FavoriteService.shared.setUserDefaults(favoriteNews)
    }
}
