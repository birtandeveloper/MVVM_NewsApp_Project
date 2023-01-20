//
//  HomePageCollectionVC.swift
//  New Project
//
//  Created by Mac Os X on 21.12.2022.
//

import UIKit
import SDWebImage

class HomePageCollectionVC: BaseCollectionController, UICollectionViewDelegateFlowLayout {
    
    private let homePageViewModel = HomePageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(HomePageViewCell.self, forCellWithReuseIdentifier: Constants.Identifier.reuseIdentifierHomePage)
        view.addSubview(homePageViewModel.activityIndicator)
        homePageViewModel.activityIndicator.fillSuperview()
        homePageViewModel.fetchData()
        homePageViewModel.delegate = self
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homePageViewModel.dataOfNews?.data.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.reuseIdentifierHomePage, for: indexPath) as! HomePageViewCell
        let news = homePageViewModel.dataOfNews?.data[indexPath.item]
        cell.newsTitle.text = news?.title
        cell.newsImage.sd_setImage(with:URL(string: news?.image_url ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: Constants.Dimensions.collectionViewStandardHeight)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = DetailsPageCollectionVC()
        detailsVC.title = Constants.Texts.NewsDetails
        detailsVC.id = homePageViewModel.dataOfNews?.data[indexPath.item].uuid
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension HomePageCollectionVC: HomePageViewModelDelegate {
    func onSuccessfulNewsLoaded() {
        self.homePageViewModel.activityIndicator.stopAnimating()
        navigationItem.title = Constants.Texts.topNewsTitle
        self.collectionView.reloadData()
    }
    
    func onError(error: Error) {
        print("Error: \(error.localizedDescription)")
    }
}
