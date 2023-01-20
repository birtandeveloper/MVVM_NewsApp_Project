//
//  DetailsPageViewModel.swift
//  New Project
//
//  Created by Mac Os X on 13.01.2023.
//

import UIKit

protocol DetailsPageViewModelDelegate: AnyObject {
    func onSuccessfulDetailsLoaded()
    func onError(error: Error)
}

class DetailsPageViewModel {
    private let apiKey = "Your API Key"
    private(set) var dataOfNewsDetails: Details?
    public weak var delegate: DetailsPageViewModelDelegate?
    
    func fetchDetailsData(id: String?) {
        let urlString = "https://api.thenewsapi.com/v1/news/uuid/\(id ?? "")?api_token=\(apiKey)"
        Service.shared.fetchGenericJsonData(urlString: urlString ) { (result: Details?, error) in
            self.dataOfNewsDetails = result
            DispatchQueue.main.async {
                self.dataOfNewsDetails = result
                self.delegate?.onSuccessfulDetailsLoaded()
            }
        }
    }
    
    let activityIndicator: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .white
        aiv.startAnimating()
        aiv.hidesWhenStopped = true
        return aiv
    }()
}
