//
//  DetailsPageViewCell.swift
//  New Project
//
//  Created by Mac Os X on 22.12.2022.
//

import UIKit
import WebKit

class DetailsPageViewCell: UICollectionViewCell {
    
    var newsDetails: Details! {        
        didSet {
            newsTitleLabel.text = newsDetails?.title
            newsDetailsLabel.text = newsDetails?.description
            image.sd_setImage(with: URL(string: newsDetails?.image_url ?? "" ))
        }
    }
    
    let image = UIImageView(backgrounColor: .black, cornerRadius: Constants.Dimensions.cornerRadiusMax, width:Constants.Dimensions.imageWidth, height: Constants.Dimensions.imageHeight)
    let newsTitleLabel = UILabel(text: "", font: .boldSystemFont(ofSize: Constants.Dimensions.systemFontMid))
    let newsDetailsLabel = UILabel(text: "", font: .systemFont(ofSize: Constants.Dimensions.systemFontNormal))

    override init(frame: CGRect) {
        super.init(frame: frame)
        let verticalStackView = VerticalStackView(arrangedSubviews: [image, newsTitleLabel, newsDetailsLabel],spacing: Constants.Dimensions.maxSpacing)
        addSubview(verticalStackView)
        verticalStackView.fillSuperview(padding: .init(top: Constants.Dimensions.maxPadding, left: Constants.Dimensions.maxPadding, bottom: Constants.Dimensions.maxPadding, right: Constants.Dimensions.maxPadding))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
