//
//  DetailView.swift
//  TestApp2
//
//  Created by Karamjeet Singh Mann on 6/26/21.
//

import Foundation
import SwiftUI

struct DetailView : View {
    
    @State var poster:Poster
    
    var body: some View {
        VStack {
            PopularMovieCell(posterPath:poster.poster_path)
            HStack {
                Text(poster.original_title)
                    .font(.title2)
                Spacer()
            }
            HStack {
                ForEach(0...4, id: \.self) { index in
                    Image(systemName: Double(index) < poster.vote_average/2 ? "star.fill" : "star")
                }
                Spacer()
            }
            HStack {
                Text(poster.overview)
                Spacer()
            }
            Spacer()
        }.padding()
    }
}
