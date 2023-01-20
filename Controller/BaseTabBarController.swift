//
//  BaseNavigatorViewController.swift
//  New Project
//
//  Created by Mac Os X on 21.12.2022.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [
            createNavController(viewController: HomePageCollectionVC(), title: Constants.Texts.NewsTitle, image: Constants.Texts.imageTextHouse),
            createNavController(viewController: TopNewsViewController(), title: Constants.Texts.topNewsTitle, image: Constants.Texts.imageTextProfil)
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: image)
        navController.navigationBar.prefersLargeTitles = true
        viewController.view.backgroundColor = .white
        return navController
    }
}
