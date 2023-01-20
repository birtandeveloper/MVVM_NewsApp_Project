//
//  HomePageViewCell.swift
//  New Project
//
//  Created by Mac Os X on 21.12.2022.
//

import UIKit


class HomePageViewCell: UICollectionViewCell {

    let newsTitle = UILabel(text: Constants.Texts.NewsTitle, font: .boldSystemFont(ofSize: Constants.Dimensions.systemFontMid))
    let newsImage = UIImageView(backgrounColor: .black, cornerRadius: Constants.Dimensions.cornerRadiusMax, width: Constants.Dimensions.imageWidth, height: Constants.Dimensions.imageHeight)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let verticalStackView = VerticalStackView(arrangedSubviews: [newsImage, newsTitle], spacing: Constants.Dimensions.minSpacing)
        addSubview(verticalStackView)
        verticalStackView.fillSuperview(padding:.init(top: Constants.Dimensions.maxPadding, left: Constants.Dimensions.maxPadding, bottom: Constants.Dimensions.maxPadding, right: Constants.Dimensions.maxPadding))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

