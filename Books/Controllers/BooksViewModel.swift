//
//  BooksViewModel.swift
//  Books
//
//  Created by Vadim on 12/8/17.
//  Copyright © 2017 Vadim. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BooksViewModel {
    let searchTerm = Variable<String>("")
    var books: Driver<[Book]> {
        return searchTerm.asObservable()
            .skip(1)
            .flatMap { searchTerm in
                return ApiService.find(matching: searchTerm)
            }
            .asDriver(onErrorJustReturn: [])
    }
}
