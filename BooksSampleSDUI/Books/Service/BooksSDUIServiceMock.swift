//
//  BooksSDUIServiceMock.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Combine
import Foundation

struct BooksSDUIServiceMock: BooksSDUIService {

    func fetchUIData() -> DataPublisher {
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
      "orientation": "horizontal",
      "background": [
        {
          "type": "solid",
          "$color": "background_color"
        }
      ],
      "height": {
        "type": "fixed",
        "value": 260
      },
      "items": [
        {
          "type": "image",
          "$image_url": "image_url",
          "width": {
            "type": "fixed",
            "value": 160
          },
          "height": {
            "type": "fixed",
            "value": 260
          },
          "margins": {
            "left": 10
          }
        },
        {
          "type": "container",
          "orientation": "vertical",
          "height": {
            "type": "match_parent"
          },
          "items": [
            {
              "type": "text",
              "font_size": 18,
              "font_weight": "bold",
              "$text": "title",
              "$text_color": "text_color",
              "margins": {
                "top": 12,
                "left": 12,
                "right": 16
              }
            },
            {
              "type": "text",
              "font_size": 16,
              "$text": "book_type",
              "$text_color": "text_color",
              "margins": {
                "top": 8,
                "left": 12,
                "right": 16
              }
            },
            {
              "type": "container",
              "orientation": "overlap",
              "height": {
                "type": "match_parent"
              },
              "items": [
                {
                  "type": "text",
                  "alignment_vertical": "bottom",
                  "alignment_horizontal": "left",
                  "font_size": 16,
                  "$text": "year",
                  "$text_color": "text_color",
                  "margins": {
                    "left": 13,
                    "bottom": 14
                  }
                }
              ]
            }
          ]
        }
      ]
    }
  },
  "cards": [
    {
      "log_id": "book_card0",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookCard",
                "title": "Ногти",
                "book_type": "Повесть, рассказы",
                "year": "2001",
                "background_color": "#1f1e4c",
                "text_color": "#ffffff",
                "image_url": "https://irecommend.ru/sites/default/files/product-images/4449/00.png"
              }
            ],
            "actions": [
                {
                    "log_id": "show_details_1",
                    "url": "http://maksimn.github.io/elizarov/books/book-1.json"
                }
            ]
          }
        }
      ]
    },
    {
      "log_id": "book_card1",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookCard",
                "title": "Pasternak",
                "book_type": "Роман",
                "year": "2003",
                "background_color": "#746452",
                "text_color": "#ffffff",
                "image_url": "https://i.livelib.ru/boocover/1000315110/200/b139/Mihail_Elizarov__Pasternak.jpg"
              }
            ],
            "actions": [
                {
                    "log_id": "show_details_2",
                    "url": "http://maksimn.github.io/elizarov/books/book-2.json"
                }
            ]
          }
        }
      ]
    },
    {
      "log_id": "book_card2",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookCard",
                "title": "Красная плёнка",
                "book_type": "Сборник рассказов",
                "year": "2005",
                "background_color": "#edc9be",
                "text_color": "#222222",
                "image_url": "https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_max1500/4368305-mihail-elizarov-krasnaya-plenka.jpg"
              }
            ],
            "actions": [
                {
                    "log_id": "show_details_3",
                    "url": "http://maksimn.github.io/elizarov/books/book-3.json"
                }
            ]
          }
        }
      ]
    },
    {
      "log_id": "book_card3",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookCard",
                "title": "Библиотекарь",
                "book_type": "Роман",
                "year": "2007",
                "background_color": "#90481e",
                "text_color": "#ffffff",
                "image_url": "https://i.livelib.ru/boocover/1000320584/200/5810/Mihail_Elizarov__Bibliotekar.jpg"
              }
            ],
            "actions": [
                {
                    "log_id": "show_details_4",
                    "url": "http://maksimn.github.io/elizarov/books/book-4.json"
                }
            ]
          }
        }
      ]
    },
    {
      "log_id": "book_card4",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookCard",
                "title": "Кубики",
                "book_type": "Рассказы",
                "year": "2008",
                "background_color": "#6f6456",
                "text_color": "#ffffff",
                "image_url": "https://i.livelib.ru/boocover/1000311720/200/5859/Mihail_Elizarov__Kubiki_sbornik.jpg"
              }
            ],
            "actions": [
                {
                    "log_id": "show_details_5",
                    "url": "http://maksimn.github.io/elizarov/books/book-5.json"
                }
            ]
          }
        }
      ]
    },
    {
      "log_id": "book_card5",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookCard",
                "title": "Мультики",
                "book_type": "Роман",
                "year": "2010",
                "background_color": "#7e654d",
                "text_color": "#ffffff",
                "image_url": "https://i.livelib.ru/boocover/1001093871/200/ec9a/Mihail_Elizarov__Multiki.jpg"
              }
            ],
            "actions": [
                {
                    "log_id": "show_details_6",
                    "url": "http://maksimn.github.io/elizarov/books/book-6.json"
                }
            ]
          }
        }
      ]
    },
    {
      "log_id": "book_card6",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookCard",
                "title": "Бураттини. Фашизм прошёл",
                "book_type": "Эссе",
                "year": "2011",
                "background_color": "#c2a6a7",
                "text_color": "#222222",
                "image_url": "https://s1.livelib.ru/boocover/1000488263/o/ea9b/Mihail_Elizarov__Burattini._Fashizm_proshel.jpeg"
              }
            ],
            "actions": [
                {
                    "log_id": "show_details_7",
                    "url": "http://maksimn.github.io/elizarov/books/book-7.json"
                }
            ]
          }
        }
      ]
    },
    {
      "log_id": "book_card7",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookCard",
                "title": "Мы вышли покурить на 17 лет...",
                "book_type": "Сборник рассказов",
                "year": "2012",
                "background_color": "#626d6c",
                "text_color": "#ffffff",
                "image_url": "https://j.livelib.ru/boocover/1000565906/200/7a1e/Mihail_Elizarov__My_vyshli_pokurit_na_17_let..._sbornik.jpg"
              }
            ],
            "actions": [
                {
                    "log_id": "show_details_8",
                    "url": "http://maksimn.github.io/elizarov/books/book-8.json"
                }
            ]
          }
        }
      ]
    }
  ]
}
"""
    }
}
