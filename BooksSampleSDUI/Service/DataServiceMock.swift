//
//  BooksSDUIServiceMock.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Combine
import Foundation

private struct Book {
    let title: String
    let bookType: String
    let year: String
    let backgroundColor: String
    let textColor: String
    let imageUrl: String
    let description: String
}

struct DataServiceMock: DataService {

    let type: String

    init(_ type: String) {
        self.type = type
    }

    func fetchData() -> DataPublisher {
        var str = ""

        if type == "http://maksimn.github.io/elizarov/books-ui.json" {
            str = booksDivJson()
        } else if type == "http://maksimn.github.io/elizarov/books/book-1.json" {
            str = bookTemplate(book1())
        }

        return Just(Data(str.utf8))
            .tryMap { $0 }
            .eraseToAnyPublisher()
    }

    private func bookTemplate(_ data: Book) -> String {
"""
{
  "templates": {
    "bookDetails": {
      "type": "container",
      "orientation": "vertical",
      "background": [
        {
          "type": "solid",
          "$color": "background_color"
        }
      ],
      "items": [
        {
          "type": "container",
          "orientation": "horizontal",
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
                        "bottom": 4
                      }
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "type": "text",
          "font_size": 16,
          "$text": "description",
          "$text_color": "text_color",
          "margins": {
            "top": 14,
            "left": 30,
            "right": 30,
            "bottom": 17
          }
        }
      ]
    }
  },
  "cards": [
    {
      "log_id": "bookdetails_card",
      "states": [
        {
          "state_id": 0,
          "div": {
            "type": "container",
            "items": [
              {
                "type": "bookDetails",
                "title": "\(data.title)",
                "book_type": "\(data.bookType)",
                "year": "\(data.year)",
                "background_color": "\(data.backgroundColor)",
                "text_color": "\(data.textColor)",
                "image_url": "\(data.imageUrl)",
                "description": "\(data.description)"
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

    private func book1() -> Book {
        Book(
            title: "Ногти",
            bookType: "Повесть, рассказы",
            year: "2001",
            backgroundColor: "#1f1e4c",
            textColor: "#fff",
            imageUrl: "https://irecommend.ru/sites/default/files/product-images/4449/00.png",
            description:
"""
\\"Повесть \\"Ногти\\" Михаила Елизарова увидела свет в начале нулевых, была отмечена в шорт-листе премии Андрея Белого, а критик Лев Данилкин назвал этот дебют лучшим по итогам 2001 года. То, что раньше считалось глубоким подпольем литературы, вдруг легитимизировалось. Образно говоря, Елизаров откусил магический ноготь, втянув страну в свой ритуал\\" (Роман Богословский).\\n\\n\\"Десять прозрачных полумесяцев Бахатов сплёвывал на газету и, в зависимости от того, как легли ногти, делал выводы о будущем. Под влиянием ногтей информация, напечатанная в газете, трансформировалась в предсказание, Бахатов получал программу поведения на следующий месяц для себя и меня. Чистота соблюдения ритуала гарантировала нашу безопасность. Гадание заканчивалось тем, что Бахатов зазубренными пальцами глубоко царапал грудь и выступившей кровью кропил ногти и бумажку, а потом всё закапывал в землю, нашёптывая неизвестные слова\\".
"""
        )
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
    }
  ]
}
"""
    }
}
