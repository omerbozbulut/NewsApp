//
//  Constants.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 23.07.2022.
//

import Foundation

struct Constants {
    static let tabBarImages = ["newspaper","bookmark.circle"]
    static let newsTableViewIdentifier = "news"
    static let favoriteTableViewIdentifier = "favorite"
    static let favoriteVCTitle = "Favorite news"
    static let dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    static let nullImageUrl = "https://img.freepik.com/free-vector/tiny-people-examining-operating-system-error-warning-web-page-isolated-flat-illustration_74855-11104.jpg?t=st=1658778171~exp=1658778771~hmac=e0e894e370eb1bcdbbc2530ca55ad932d3c6da8b19efb37c6d2ef7cf91d8833c&w=1480"
    
    struct Fonts {
            static let TrebuchetMSBold = "TrebuchetMS-Bold"
            static let helvetica = "Helvetica"
            static let helveticaBOLD = "Helvetica-Bold"
            static let helveticaMedium = "HelveticaNeue-Medium"
    }

    struct SymbolNames {
           static let starSymbolName = "star.fill"
           static let bookmarkSymbolName = "bookmark"
           static let bookmarkFillSymbolName = "bookmark.fill"
           static let listBulletCircle = "list.bullet.circle"
    }


    //MARK: - Service Constants
    struct ServiceEndPointConverter {
        static let categoryNames = [("business","&category=business"),
                                    ("entertainment","&category=entertainment"),
                                    ("general","&category=general"),
                                    ("health","&category=health"),
                                    ("science","&category=science"),
                                    ("sports","&category=sports"),
                                    ("technology","&category=technology")]

        static func convertSearchText(searchText: String?)-> String?{
            guard let text = searchText else {return nil}
            return "&q=\(text)"
        }
    }

    enum ServiceEndPoint: String {
        case BASE_URL = "https://newsapi.org/v2/top-headlines?"
        case COUNTRY = "&country=us"
        case API_KEY = "apiKey=fcc9c8c235b443cfaecb60d5983a14e7"

        static func newsServiceEndPoint(category: String?, searchText: String?) -> String {
            "\(BASE_URL.rawValue)\(API_KEY.rawValue)\(COUNTRY.rawValue)\(category ?? "")\(searchText ?? "")"
        }
    }
}
