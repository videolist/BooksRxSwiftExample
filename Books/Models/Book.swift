//
//  Book.swift
//  Books
//
//  Created by Vadim on 12/8/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation

struct BookResponse: Decodable {
    var items: [Book]
}

struct Book: Decodable {
    var title: String {
        return volumeInfo.title
    }
    var thumbnailUrl: URL {
        return volumeInfo.imageLinks.thumbnail
    }
    
    var authors: [String] {
        return volumeInfo.authors
    }
    
    var publishedDate: String {
        return volumeInfo.publishedDate
    }
    
    var volumeInfo: VolumeInfo

    struct VolumeInfo: Decodable {
        var title: String
        var authors: [String]
        var imageLinks: ImageLinks
        var publishedDate: String
    }
    
    struct ImageLinks: Decodable {
        var smallThumbnail: URL
        var thumbnail: URL
    }
}
