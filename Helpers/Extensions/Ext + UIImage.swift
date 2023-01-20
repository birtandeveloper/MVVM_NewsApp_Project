//
//  Ext + UIImage.swift
//  New Project
//
//  Created by Mac Os X on 22.12.2022.
//

import UIKit

extension UIImageView {
    convenience init(backgrounColor: UIColor, cornerRadius: CGFloat, width: CGFloat, height: CGFloat) {
        self.init(image: nil)
        self.backgroundColor = backgrounColor
        self.layer.cornerRadius = cornerRadius
        self.constrainHeight(constant: height)
        self.constrainWidth(constant: width)
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
