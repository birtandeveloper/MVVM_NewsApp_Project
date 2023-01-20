//
//  Ext + UILabel.swift
//  New Project
//
//  Created by Mac Os X on 22.12.2022.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 0) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}
