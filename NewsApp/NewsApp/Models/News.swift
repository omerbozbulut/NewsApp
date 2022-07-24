//
//  News.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//

import Foundation

struct BaseResponse: Codable {
    let status: String
    let articles: [Article]
}

struct Article: Codable {
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}
