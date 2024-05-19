//
//  ArticleDetailView.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import SwiftUI

struct ArticleDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var model: ArticleModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: model.mediumImageURL) { image in
                image
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView("Loading...")
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
            }
            Text(model.title)
                .font(.headline)
                .foregroundColor(.black)
            Text(model.abstract)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        .navigationTitle("NY Times")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}
