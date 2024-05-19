//
//  ArticleVM.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import Foundation
import Resolver

final class ArticleVM: ObservableObject {
    
    @Injected private var repo: DataRepository
    @Published var articlesList: [ArticleModel] = []
    
    @MainActor func getMostViewedArticlesList(period: Int) async {
        do {
            let articles = try await repo.getMostViewedArticlesList(period: period).articles
            self.articlesList = articles
        } catch {
            print(error)
        }
    }
}
