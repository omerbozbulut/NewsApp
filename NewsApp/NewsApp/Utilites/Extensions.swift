//
//  Extensions.swift
//  NewsApp
//
//  Created by omer faruk bozbulut on 25.07.2022.
//

import Foundation

extension TimeInterval{
        func stringFromTimeInterval() -> String {
            let time = NSInteger(self)
            let hours = (time / 3600) * -1
            return String(format: "%2d hours ago",hours)
        }
    }
