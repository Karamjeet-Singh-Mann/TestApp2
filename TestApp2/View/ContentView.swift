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
    @State var txtSearch:String = ""

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack {
                    Text("Now Playing")
                        .font(.title)
                    TextField("Search Movies", text: $txtSearch)
                        .padding()
                    
                    ForEach(posters.filter({  self.txtSearch.isEmpty ?  true :  $0.original_title.contains(txtSearch) }), id: \.self) { poster in
                        ZStack {
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
                            VStack {
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        if let index_ = posters.map({$0.title}).firstIndex(of: poster.title) {
                                            posters.remove(at: index_)
                                        }
                                        
                                    }, label: {
                                        Image(systemName:"x.circle.fill")
                                            .foregroundColor(.red)
                                            .padding()
                                    })
                                }
                                Spacer()
                            }
                            
                        }
                        
                    }
                }
            }.onAppear(perform: {
                Network.fetchPosters { posters_ in
                    self.posters = posters_
                }
            })
        }
    }
  
}
