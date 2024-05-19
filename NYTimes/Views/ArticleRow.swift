//
//  ArticleRow.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 18/05/2024.
//

import SwiftUI

struct ArticleRow: View {
    
    var model: ArticleModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                articleImage
                articleTitle
            }
            articleAbstract
            articlePublishedDate
        }
    }
    
    private var articleImage: some View {
        AsyncImage(url: model.thumbnailImageURL) { image in
            image
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.gray, lineWidth: 1)
                )
        } placeholder: {
            ProgressView("Loading...")
                .frame(maxWidth: 70, maxHeight: 70)
        }
    }
    
    private var articleTitle: some View {
        Text(model.title)
            .font(.footnote)
            .bold()
            .foregroundColor(.black)
    }
    
    private var articleAbstract: some View {
        Text(model.abstract)
            .font(.footnote)
            .foregroundColor(.gray)
    }
    
    private var articlePublishedDate: some View {
        HStack {
            Spacer()
            Image(systemName: "calendar")
                .foregroundStyle(.gray)
                .font(.body)
            Text(model.publishedDate)
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}
