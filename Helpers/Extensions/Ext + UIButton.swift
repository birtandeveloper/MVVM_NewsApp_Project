//
//  Ext + UIButton.swift
//  New Project
//
//  Created by Mac Os X on 22.12.2022.
//

import UIKit

extension UIButton {
    convenience init(type: ButtonType, title: String, titleColor: UIColor, state: UIControl.State, font: UIFont, backgrounColor: UIColor, width: CGFloat, cornerRadius: CGFloat ) {
        self.init(type: type)
        self.setTitle(title, for: state)
        self.setTitleColor(titleColor, for: state)
        self.backgroundColor = backgrounColor
        self.titleLabel?.font = font
        self.constrainWidth(constant: width)
        self.layer.cornerRadius = cornerRadius
    }
}
