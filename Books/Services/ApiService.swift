//
//  ApiService.swift
//  Books
//
//  Created by Vadim on 12/8/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import RxAlamofire
import RxSwift

class ApiService {
    static let apiKey = "AIzaSyDd7NfQTBWiBcm9ZASMVYHKUX1U3aLtR88"
    static let baseUrl = "https://www.googleapis.com/books/v1/volumes"
    
    static func find(matching term: String) -> Observable<[Book]> {
        let query = baseUrl + "?q=\(term)" + "&key=\(apiKey)"
        return data(.get, query)
            .map { (data) in
                if let response = try? JSONDecoder().decode(BookResponse.self, from: data) {
                    return response.items
                }
                return []
            }
    }

}
