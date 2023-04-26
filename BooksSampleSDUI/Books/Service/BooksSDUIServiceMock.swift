//
//  BooksSDUIServiceMock.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Combine
import Foundation

struct BooksSDUIServiceMock: BooksSDUIService {

    func fetchUIData() -> AnyPublisher<Data, Error> {
        Just(Data(booksDivJson().utf8))
            .tryMap { $0 }
            .eraseToAnyPublisher()
    }

    private func booksDivJson() -> String {
         """
         {
             "templates": {
                 "bookCard": {
                     "type": "container",
                     "items": [
                         {
                             "type": "text",
                             "font_size": 21,
                             "font_weight": "bold",
                             "margins": {
                                 "bottom": 16
                             },
                             "$text": "title"
                         }
                     ],
                     "margins": {
                         "bottom": 6
                     },
                     "orientation": "vertical",
                     "paddings": {
                         "top": 10,
                         "bottom": 0,
                         "left": 30,
                         "right": 30
                     }
                 }
             },
             "cards": [{
                 "log_id": "book_card0",
                 "states": [
                     {
                         "state_id": 0,
                         "div": {
                             "type": "container",
                             "items": [
                                 {
                                     "type": "bookCard",
                                     "title": "Ногти"
                                 }
                             ]
                         }
                     }
                 ]
             },{
                 "log_id": "book_card0",
                 "states": [
                     {
                         "state_id": 0,
                         "div": {
                             "type": "container",
                             "items": [
                                 {
                                     "type": "bookCard",
                                     "title": "Pasternak"
                                 }
                             ]
                         }
                     }
                 ]
             },{
                 "log_id": "book_card0",
                 "states": [
                     {
                         "state_id": 0,
                         "div": {
                             "type": "container",
                             "items": [
                                 {
                                     "type": "bookCard",
                                     "title": "Красная плёнка"
                                 }
                             ]
                         }
                     }
                 ]
             },{
                 "log_id": "book_card0",
                 "states": [
                     {
                         "state_id": 0,
                         "div": {
                             "type": "container",
                             "items": [
                                 {
                                     "type": "bookCard",
                                     "title": "Библиотекарь"
                                 }
                             ]
                         }
                     }
                 ]
             },{
                 "log_id": "book_card0",
                 "states": [
                     {
                         "state_id": 0,
                         "div": {
                             "type": "container",
                             "items": [
                                 {
                                     "type": "bookCard",
                                     "title": "Кубики"
                                 }
                             ]
                         }
                     }
                 ]
             },{
                 "log_id": "book_card0",
                 "states": [
                     {
                         "state_id": 0,
                         "div": {
                             "type": "container",
                             "items": [
                                 {
                                     "type": "bookCard",
                                     "title": "Мультики"
                                 }
                             ]
                         }
                     }
                 ]
             },{
                 "log_id": "book_card0",
                 "states": [
                     {
                         "state_id": 0,
                         "div": {
                             "type": "container",
                             "items": [
                                 {
                                     "type": "bookCard",
                                     "title": "Бураттини. Фашизм прошёл"
                                 }
                             ]
                         }
                     }
                 ]
             },{
                 "log_id": "book_card0",
                 "states": [
                     {
                         "state_id": 0,
                         "div": {
                             "type": "container",
                             "items": [
                                 {
                                     "type": "bookCard",
                                     "title": "Мы вышли покурить на 17 лет..."
                                 }
                             ]
                         }
                     }
                 ]
             }]
         }
         """
    }
}
