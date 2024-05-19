//
//  NYTimesApp.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import SwiftUI
import Resolver

@main
struct NYTimesApp: App {
    init() {
        Resolver.registerAllServices()
        KeychainHelper.standard.save("ATEwR4YQzokwD8aF0mTgKma1PzLhMwQ5", forKey: "API_KEY")
    }
    var body: some Scene {
        WindowGroup {
            ArticlesListView()
        }
    }
}
