//
//  BaseCollectionVC.swift
//  New Project
//
//  Created by Mac Os X on 22.12.2022.
//

import UIKit

class BaseCollectionController: UICollectionViewController {
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
