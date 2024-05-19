//
//  DataRepository.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import Foundation
import Resolver

protocol DataRepository {
    func getMostViewedArticlesList(period: Int) async throws -> ArticleModelResponse
}

var networkManager: NetworkManagerProtocol { Resolver.resolve() }

class DataRepo: DataRepository {
    
    @Injected private var remoteRepo: RemoteDataRepo
    
    func getMostViewedArticlesList(period: Int) async throws -> ArticleModelResponse {
        try await remoteRepo.getMostViewedArticlesList(period: period)
    }
    
    struct RemoteDataRepo: DataRepository {
        func getMostViewedArticlesList(period: Int) async throws -> ArticleModelResponse {
            try await networkManager.executeGetRequest(address: .getMostViewedArticlesList(period: period))
        }
    }
}
