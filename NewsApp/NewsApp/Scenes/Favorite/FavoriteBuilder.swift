//
//  FavoriteBuilder.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 2.08.2022.
//

import UIKit

final class FavoriteBuilder {
    static func buildFavorite() -> UIViewController{
        let viewModel = FavoriteViewModel(FavoriteService.shared.getFavoriteList())
        let viewController = FavoriteNewsViewController(viewModel)
        return viewController
    }
}
