//
//  News.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 24.07.2022.
//
/*
import Foundation

struct BaseResponse: Codable {
    let status: String
    let articles: [Article]
}

struct Article: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
 */

import Foundation

// MARK: - BaseResponse
struct BaseResponse: Codable {
    let status: String
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let articleDescription: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let name: String
}
