//
//  DetailsPageCollectionVC.swift
//  New Project
//
//  Created by Mac Os X on 22.12.2022.
//

import UIKit

class DetailsPageCollectionVC: BaseCollectionController, UICollectionViewDelegateFlowLayout {
    
    private let detailPageVM = DetailsPageViewModel()
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(detailPageVM.activityIndicator)
        detailPageVM.activityIndicator.fillSuperview()        
        collectionView.register(DetailsPageViewCell.self, forCellWithReuseIdentifier: Constants.Identifier.reuseIdentifierDetailsPage)
        detailPageVM.fetchDetailsData(id: id)
        detailPageVM.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Constants.Section.minSectionNumber
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifier.reuseIdentifierDetailsPage, for: indexPath) as! DetailsPageViewCell
        cell.newsDetails = detailPageVM.dataOfNewsDetails
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let dummyCell = DetailsPageViewCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: Constants.Dimensions.cellMaxHeight))
        dummyCell.newsDetails = detailPageVM.dataOfNewsDetails
        dummyCell.layoutIfNeeded()
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: Constants.Dimensions.cellMaxHeight))
        return .init(width: view.frame.width, height: estimatedSize.height)
    }
}

extension DetailsPageCollectionVC: DetailsPageViewModelDelegate {
    func onSuccessfulDetailsLoaded() {
        self.detailPageVM.activityIndicator.stopAnimating()
        self.collectionView.reloadData()
    }
    func onError(error: Error) {
        print("Error:\(error.localizedDescription)")
    }
}
