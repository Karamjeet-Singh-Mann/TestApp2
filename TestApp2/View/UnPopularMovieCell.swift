//
//  UnPopularMovieCell.swift
//  TestApp2
//
//  Created by Karamjeet Singh Mann on 6/26/21.
//

import Foundation
import SwiftUI

struct UnPopularMovieCell : View{
    
    var poster:Poster
    
    var body:some View {
        HStack {
            Image("photo")
                .data(url: URL(string:"https://image.tmdb.org/t/p/original\(poster.poster_path)")!)
                .scaledToFit()
                .cornerRadius(5.0)
                .padding()
            VStack {
                Text(poster.original_title)
                    .font(.title)
                Text(poster.overview)
                    .lineLimit(5)
            }
        }
    }
}
