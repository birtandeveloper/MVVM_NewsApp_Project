//
//  HomePageViewModel.swift
//  New Project
//
//  Created by Mac Os X on 13.01.2023.
//

import UIKit

protocol HomePageViewModelDelegate: AnyObject {
    func onSuccessfulNewsLoaded()
    func onError(error: Error)
}

class HomePageViewModel {
    private let apiKey = "Your API Key"
    private(set) var dataOfNews: DataResult?
    public weak var delegate: HomePageViewModelDelegate?
    
    func fetchData() {
         let url = "https://api.thenewsapi.com/v1/news/top?api_token=\(apiKey)&locale=us"
         Service.shared.fetchGenericJsonData(urlString: url) {(result: DataResult?, error) in
             self.dataOfNews = result
             DispatchQueue.main.async {
                 self.dataOfNews = result
                 self.delegate?.onSuccessfulNewsLoaded()
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


