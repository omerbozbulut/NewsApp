//
//  ArticleDatas.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation

class ArticleData {

    static let Shared = ArticleData()

    init(){}

    var articles = [Article]()
}
