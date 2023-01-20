//
//  TopNewsViewController.swift
//  MVVM_NewsApp
//
//  Created by Mac Os X on 19.01.2023.
//

import UIKit

class TopNewsViewController: BaseCollectionController,UICollectionViewDelegateFlowLayout {
    
    private let topNewsModel = TopNewsViewModel()
    
    override func viewDidLoad() {
        collectionView.register(TopNewsViewCell.self, forCellWithReuseIdentifier: Constants.Identifier.reuseIdentifierTopNews)
        navigationItem.title = Constants.Texts.topNewsTitle
        view.addSubview(topNewsModel.activityIndicator)
        topNewsModel.activityIndicator.fillSuperview()
        topNewsModel.fetchTopNews()
        topNewsModel.delegate = self
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Constants.Section.minSectionNumber
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topNewsModel.topNewsResult?.data.count ?? 0
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.reuseIdentifierTopNews, for: indexPath) as! TopNewsViewCell
        let topNews = topNewsModel.topNewsResult?.data[indexPath.item]
        cell.topNewsImage.sd_setImage(with: URL(string: topNews?.image_url ?? ""))
        cell.topNewsLabel.text = topNews?.title
        cell.topNewsSnippet.text = topNews?.snippet
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsVC = DetailsPageCollectionVC()
        detailsVC.title = Constants.Texts.NewsDetails
        detailsVC.id = topNewsModel.topNewsResult?.data[indexPath.item].uuid
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: Constants.Dimensions.collectionViewStandardHeight)
    }
    
}

extension TopNewsViewController: TopNewsViewModelDelegate {
    func onSuccessfulTopNewsLoaded() {
        self.topNewsModel.activityIndicator.stopAnimating()
        navigationItem.title = Constants.Texts.topNewsTitle
        self.collectionView.reloadData()
    }
    
    func onError(error: Error) {
        print("Error:\(error.localizedDescription)")
    }
    
    
    
}
