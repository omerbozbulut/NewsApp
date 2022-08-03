//
//  Favorite.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 2.08.2022.
//

import Foundation

final class FavoriteService {

    static let shared = FavoriteService()

    init() {
        favoriteNews = getUserdefaults()
    }

    private var favoriteNews = [Article]()

    func getUserdefaults()->[Article]{
        if let data = UserDefaults.standard.value(forKey: "Favorite") as? Data {
            if let favoriteList = try? PropertyListDecoder().decode(Array<Article>.self, from: data){
                return favoriteList
            }
        }
        return [Article]()
    }

    func setUserDefaults(_ favoriteNews: [Article]) {
        self.favoriteNews = favoriteNews
        UserDefaults.standard.set(try? PropertyListEncoder().encode(favoriteNews), forKey: "Favorite")
    }

    func getFavoriteList() -> [Article]{
        return favoriteNews
    }
}
