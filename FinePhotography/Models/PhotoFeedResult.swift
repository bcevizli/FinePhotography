//
//  PhotoFeedResult.swift
//  FinePhotography
//
//  Created by Adem Burak Cevizli on 6.03.2023.
//

import Foundation

struct PhotoFeedResult: Codable {
    var total_results: Int
    var page: Int
    var per_page: Int
    var photos: [Photo]
}
