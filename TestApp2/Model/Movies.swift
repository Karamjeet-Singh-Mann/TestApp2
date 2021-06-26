//
//  Movies.swift
//  TestApp2
//
//  Created by Karamjeet Singh Mann on 6/26/21.
//

import Foundation
struct Movies:Codable {
    var dates:Dates
    var page:Int
    var total_pages:Int
    var total_results:Int
    var results:[Poster]
}
