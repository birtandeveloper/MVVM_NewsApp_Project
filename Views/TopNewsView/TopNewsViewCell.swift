//
//  TopNewsViewCell.swift
//  MVVM_NewsApp
//
//  Created by Mac Os X on 19.01.2023.
//

import UIKit

class TopNewsViewCell: UICollectionViewCell {
    
    let topNewsImage = UIImageView(backgrounColor: .black, cornerRadius: Constants.Dimensions.cornerRadiusMax, width: Constants.Dimensions.imageWidth , height: Constants.Dimensions.imageHeight)
    let topNewsLabel = UILabel(text: "", font: .systemFont(ofSize: Constants.Dimensions.systemFontNormal))
    let topNewsSnippet = UILabel(text: "", font: .boldSystemFont(ofSize: Constants.Dimensions.systemFontMid),numberOfLines: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let verticalStackView = VerticalStackView(arrangedSubviews: [topNewsImage, topNewsSnippet, topNewsLabel], spacing: Constants.Dimensions.minSpacing)
        addSubview(verticalStackView)
        verticalStackView.fillSuperview(padding: .init(top: Constants.Dimensions.minPadding, left: Constants.Dimensions.minPadding, bottom: Constants.Dimensions.minPadding, right: Constants.Dimensions.minPadding))
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
