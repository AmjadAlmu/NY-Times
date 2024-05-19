//
//  EndPoint.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import Foundation

struct EndPoint {
    var address: Address
    
    init(address: Address) {
        self.address = address
    }
}

enum Address {
    
    case getMostViewedArticlesList(period: Int)
    
    var urlPath: String? {
        
        guard let apiKey = KeychainHelper.standard.read(forKey: "API_KEY") else {
            return nil
        }
        
        switch self {
        case .getMostViewedArticlesList(let period):
            return "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/\(period).json?api-key=\(apiKey)"
        }
    }
}
