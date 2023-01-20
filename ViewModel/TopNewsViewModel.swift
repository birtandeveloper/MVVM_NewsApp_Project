//
//  TopNewsViewModel.swift
//  MVVM_NewsApp
//
//  Created by Mac Os X on 19.01.2023.
//

import UIKit

protocol TopNewsViewModelDelegate: AnyObject {
    func onSuccessfulTopNewsLoaded()
    func onError(error: Error)
}

class TopNewsViewModel {
    
    private let apiKey = "Your API Key"
    private(set) var topNewsResult: TopNews?
    public weak var delegate: TopNewsViewModelDelegate?
 
    func fetchTopNews() {
        let url = "https://api.thenewsapi.com/v1/news/all?api_token=\(apiKey)&language=en&limit=3"
        Service.shared.fetchGenericJsonData(urlString: url) {(result: TopNews?, error) in
            self.topNewsResult = result
            DispatchQueue.main.async {
                self.topNewsResult = result
                self.delegate?.onSuccessfulTopNewsLoaded()
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


