//
//  NewsBuilder.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import UIKit

final class NewsBuilder {
    static func buildNews() -> UIViewController {
        let service = WebService()
        let viewModel: NewsViewModel = NewsViewModel(service)
        let viewController = NewsViewController(viewModel)
        return viewController
    }
}
