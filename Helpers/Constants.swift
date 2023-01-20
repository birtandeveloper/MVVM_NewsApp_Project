//
//  Constants.swift
//  New Project
//
//  Created by Mac Os X on 26.12.2022.
//

import UIKit

struct Constants {
    struct Dimensions {
        static let minPadding:CGFloat = 16
        static let maxPadding:CGFloat = 20
        static let systemFontNormal:CGFloat = 16
        static let systemFontMid:CGFloat = 18
        static let minSpacing:CGFloat = 16
        static let maxSpacing:CGFloat = 20
        static let cornerRadiusMin:CGFloat = 10
        static let cornerRadiusMax:CGFloat = 20
        static let imageWidth:CGFloat = 225
        static let imageHeight:CGFloat = 300
        static let collectionViewStandardHeight:CGFloat = 400
        static let cellMaxHeight:CGFloat = 1000
        static let minSectionNumber: CGFloat = 1
    }
    struct Identifier {
        static let reuseIdentifierHomePage = "Cell"
        static let reuseIdentifierDetailsPage = "CellDetails"
        static let reuseIdentifierTopNews = "CellTopNews"
    }
    struct Texts {
        static let NewsTitle = "News"
        static let NewsDetails = "News Details"
        static let imageTextHouse = "house"
        static let imageTextProfil = "newspaper.fill"
        static let topNewsTitle = "Top News"
        static let Home = "Home"
    }
    struct Section {
        static let minSectionNumber:Int = 1
    }
}

