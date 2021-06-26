//
//  PopularMovieCell.swift
//  TestApp2
//
//  Created by Karamjeet Singh Mann on 6/26/21.
//

import Foundation
import SwiftUI


struct PopularMovieCell : View{
    
    var posterPath:String
    
    var body:some View {
        ZStack {
            Image("photo")
                .data(url: URL(string:"https://image.tmdb.org/t/p/w342\(posterPath)")!)
                .frame(height: 200.00)
                .scaledToFill()
                .cornerRadius(5.0)
                .padding()
            Image(systemName: "play.circle")
                .scaleEffect(5.0)
                .foregroundColor(.white)
        }.frame(height: 200.00)
        
    }
}
