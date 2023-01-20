//
//  TopNews.swift
//  MVVM_NewsApp
//
//  Created by Mac Os X on 19.01.2023.
//

import UIKit

struct TopNews: Codable {
    let data: [TopNewsFeedResult]
}

struct TopNewsFeedResult: Codable {
    let uuid: String?
    let title: String?
    let description: String?
    let image_url: String?
    let snippet: String?
}
