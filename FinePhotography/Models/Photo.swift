//
//  Photo.swift
//  FinePhotography
//
//  Created by Adem Burak Cevizli on 6.03.2023.
//

import Foundation

struct Photo: Codable {
    var id: Int
    var photographer: String
    var photographer_url: String
    var photographer_tag: String {
        return photographer_url.replacingOccurrences(of: "https://www.pexels.com", with: "")
    }
    var src: PhotoSize
}
