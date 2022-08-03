//
//  FavoriteBuilder.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 2.08.2022.
//

import UIKit

final class FavoriteBuilder {
    static func buildFavorite() -> UIViewController{
        let viewModel = FavoriteViewModel(Favorites.shared.getFavoriteList())
        let controller = FavoriteNewsViewController(viewModel)
        return controller
    }
}
