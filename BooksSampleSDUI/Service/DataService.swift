//
//  BooksSDUIService.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Combine
import Foundation

typealias DataPublisher = AnyPublisher<Data, Error>

protocol DataService {

    func fetchData() -> DataPublisher
}
