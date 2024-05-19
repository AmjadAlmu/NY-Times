//
//  ArticlesListView.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import SwiftUI

struct ArticlesListView: View {
    
    @StateObject private var vm = ArticleVM()
    
    @State private var selectedArticle: ArticleModel?
    @State private var isDetailActive = false
    @State private var selectedPeriod = 7
    
    var body: some View {
        NavigationStack {
            List {
                Picker("", selection: $selectedPeriod) {
                    Text("Day").tag(1)
                    Text("Week").tag(7)
                    Text("Month").tag(30)
                }
                .onChange(of: selectedPeriod) {
                    Task {
                        await vm.getMostViewedArticlesList(period: selectedPeriod)
                    }
                }
                .pickerStyle(.segmented)
                ForEach(vm.articlesList) { article in
                    ArticleRow(model: article)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedArticle = article
                            isDetailActive = true
                        }
                }
            }
            .navigationTitle("NY Times News Feed")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $isDetailActive) {
                if let selectedArticle = selectedArticle {
                    ArticleDetailView(model: selectedArticle)
                }
            }
        }
        .task {
            await vm.getMostViewedArticlesList(period: selectedPeriod)
        }
    }
}
