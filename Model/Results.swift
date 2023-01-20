//
//  Results.swift
//  New Project
//
//  Created by Mac Os X on 28.12.2022.
//

import UIKit

struct DataResult: Codable {
    let data: [FeedResult]
}
struct FeedResult: Codable {
    let uuid: String?
    let title: String?
    let description: String?
    let image_url: String?
}
