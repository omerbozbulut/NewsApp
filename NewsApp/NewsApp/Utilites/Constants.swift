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

        static func DateFromConverter(date: String) -> String?{
            if date.isEmpty {
                return nil
            }
            return "&from=\(date)"
        }

        static func DateToConverter(date: String) -> String?{
            if date.isEmpty {
                return nil
            }
            return "&to=\(date)"
        }
    }

    enum ServiceEndPoint: String {
        case BASE_URL = "https://newsapi.org/v2/"
        case topHeadlines = "top-headlines?"
        case everything = "everything?"
        case COUNTRY = "&country=us"
        case API_KEY = "apiKey=2f0863b0310d4c948e58c0f336654456"

        static func newsServiceEndPoint(category: String?) -> String {
            "\(BASE_URL.rawValue)\(topHeadlines.rawValue)\(API_KEY.rawValue)\(COUNTRY.rawValue)\(category ?? "")"
        }

        static func newsServiceSearchEndPoint(searchText: String, startingDate: String, endDate: String) -> String {
            "\(BASE_URL.rawValue)\(everything.rawValue)\(API_KEY.rawValue)&q=\(searchText)\(Constants.ServiceEndPointConverter.DateFromConverter(date: startingDate) ?? "")\(Constants.ServiceEndPointConverter.DateToConverter(date: endDate) ?? "")"
        }
    }
}
