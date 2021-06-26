//
//  Network.swift
//  TestApp2
//
//  Created by Karamjeet Singh Mann on 6/26/21.
//

import Foundation

class Network {
    class func fetchPosters(_ completion:@escaping (([Poster]) -> Void)) {
        guard let url_ = URL(string:  "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&page=3") else { return }
        let urlRequest_ = URLRequest(url: url_ , cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 60.0)
        URLSession.shared.dataTaskPublisher(for: urlRequest_)
            .map{$0.data}
            .decode(type: Movies.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .receive(on: DispatchQueue.main)
            .sink { error in
                print(error)
            } receiveValue: { result in
                completion( result.results)
            }.store(in: &subscriptions)
        
    }
}
