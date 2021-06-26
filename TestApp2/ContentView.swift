//
//  ContentView.swift
//  TestApp2
//
//  Created by Karamjeet Singh Mann on 6/25/21.
//

import SwiftUI
import Combine

var subscriptions:Set<AnyCancellable> = []

struct ContentView: View {
    @State var posters:[Poster] = []
    @State var showDetail:Bool = false

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack {
                    ForEach(posters, id: \.self) { poster in
                        if poster.vote_count > 7 {
                            PopularMovieCell(posterPath:poster.poster_path)
                                .onTapGesture {
                                    self.showDetail = true
                                }
                                .fullScreenCover(isPresented: $showDetail, onDismiss: nil) {
                                    DetailView(poster: poster)
                                }
                        } else {
                            UnPopularMovieCell(poster: poster)
                                .onTapGesture {
                                    self.showDetail = true
                                }
                                .fullScreenCover(isPresented: $showDetail, onDismiss: nil) {
                                    DetailView(poster: poster)
                                }
                        }
                    }
                }
            }.onAppear(perform: {
                Network.fetchPosters()
            })
        }
    }
  
}
