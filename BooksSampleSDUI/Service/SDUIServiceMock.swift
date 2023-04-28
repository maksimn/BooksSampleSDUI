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

struct SDUIServiceMock: SDUIService {

    let type: String

    init(_ type: String) {
        self.type = type
    }

    func fetchUIData() -> DataPublisher {
        var str = ""

        if type == "books" {
            str = booksDivJson()
        } else if type == "http://maksimn.github.io/elizarov/books/book-1.json" {
            str = bookTemplate(book1())
        } else if type == "http://maksimn.github.io/elizarov/books/book-2.json" {
            str = bookTemplate(book2())
        } else if type == "http://maksimn.github.io/elizarov/books/book-3.json" {
            str = bookTemplate(book3())
        } else if type == "http://maksimn.github.io/elizarov/books/book-4.json" {
            str = bookTemplate(book4())
        } else if type == "http://maksimn.github.io/elizarov/books/book-5.json" {
            str = bookTemplate(book5())
        } else if type == "http://maksimn.github.io/elizarov/books/book-6.json" {
            str = bookTemplate(book6())
        } else if type == "http://maksimn.github.io/elizarov/books/book-7.json" {
            str = bookTemplate(book7())
        } else if type == "http://maksimn.github.io/elizarov/books/book-8.json" {
            str = bookTemplate(book8())
        } else if type == "http://maksimn.github.io/elizarov/books/book-9.json" {
            str = bookTemplate(book9())
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

    private func book2() -> Book {
        Book(
            title: "Pasternak",
            bookType: "Роман",
            year: "2003",
            backgroundColor: "#746452",
            textColor: "#fff",
            imageUrl: "https://i.livelib.ru/boocover/1000315110/200/b139/Mihail_Elizarov__Pasternak.jpg",
            description:
"""
Роман \\"Pasternak\\" состоит из битв и философских диспутов, его называют интеллектуальным триллером, православным боевиком с элементами достоевщины и тарантиновщины. Поэт Пастернак предстаёт здесь гигантским демоном, порождением зла, захватывающим умы русской интеллигенции, а борьба с ним ведётся не словом, но оружием.\\n\\n\\"Льнов видит косо воткнутый в землю электростолб. Провода, точно стальные тросы, удерживают его, этим он похож на крест соборного купола. На перекладине неподвижно сидит огромное существо. Оно распахивает рваной формы крылья. Перепончатая их изнанка лунно-белёсого цвета и покрыта надписями. Гигантский конский череп ещё носит искажённые человеческие черты мёртвого поэта. Глаза его горят бледным гнилостным свечением. Чёрная слизь струится с крыльев, но не капает на землю, оставаясь внутри сущности, словно это не демоническая плоть сочится, а ветер колеблет мазутный шёлк мантии на птичьих плечах трупа.\\n\\nЛьнов пытается прочесть надписи на крыльях, слышит голос священника: \\"Не читай дактиль на этих птерах!\\"
"""
        )
    }

    private func book3() -> Book {
        Book(
            title: "Красная плёнка",
            bookType: "Сборник рассказов",
            year: "2005",
            backgroundColor: "#edc9be",
            textColor: "#222",
            imageUrl: "https://cv0.litres.ru/pub/c/elektronnaya-kniga/cover_max1500/4368305-mihail-elizarov-krasnaya-plenka.jpg",
            description:
"""
\\"Некоторые из сюжетов Елизарова уже гуляют по Москве в виде анекдотов\\"\\nАфиша.\\n\\n\\"Алхимическая смесь Гоголя, русской реальности и черной магии\\"\\nBerliner Zeitung.\\n\\n\\"Славу писателя Елизаров обрел на маршруте Харьков - Гамбург - Москва. Столицу потряс сборником \\"Ногти\\", потов и вовсе стал местной литературной достопримечательностью\\".\\nPlayboy.
"""
        )
    }

    private func book4() -> Book {
        Book(
            title: "Библиотекарь",
            bookType: "Роман",
            year: "2007",
            backgroundColor: "#90481e",
            textColor: "#fff",
            imageUrl: "https://i.livelib.ru/boocover/1000320584/200/5810/Mihail_Elizarov__Bibliotekar.jpg",
            description:
"""
\\"Библиотекарь\\" – роман, удостоенный премии \\"Русский Букер\\" и породивший скандалы и дискуссии в обществе; роман о священных текстах – но без \\"книжной пыли\\" Борхеса и Эко: книги здесь используются по прямому архетипическому назначению – оправленные в металл, они сокрушают слабенькие черепные коробки, ломают судьбы, зовут на костёр и вторгаются в ткань мироздания.\\n\\n...Скучнейшие производственные романы всеми забытого советского писателя Громова спустя годы после его смерти обнаруживают в себе магические свойства: каждый способен наделить читателя сверхъестественными способностями. За право читать Книгу приходится сражаться с топором в руке...
"""
        )
    }

    private func book5() -> Book {
        Book(
            title: "Кубики",
            bookType: "Рассказы",
            year: "2008",
            backgroundColor: "#6f6456",
            textColor: "#fff",
            imageUrl: "https://i.livelib.ru/boocover/1000311720/200/5859/Mihail_Elizarov__Kubiki_sbornik.jpg",
            description:
"""
Сборник новых рассказов Михаила Елизарова \\"Кубики\\" - это 14 историй, объединенных единой стилистической атмосферой, которую можно было бы (весьма приблизительно) охарактеризовать как художественный синтез прозы Андрея Платонова, Юрия Мамлеева, Ирвина Уэлша, Кафки и раннего Сорокина. Действие этих жестких и одновременно романтических историй происходит в условные \\"девяностые\\" на окраине какого-то неназванного города.\\n\\nХудожественная виртуозность, демонстрируемая Елизаровым в \\"Кубиках\\" настолько очевидна и впечатляюща, что заставляет читателя погрузиться в елизаровский мир с головой - как в захватывающее кино наподобие \\"Груза 200\\" Алексея Балабанова или Blue Velvet Дэвида Линча.
"""
        )
    }

    private func book6() -> Book {
        Book(
            title: "Мультики",
            bookType: "Роман",
            year: "2010",
            backgroundColor: "#7e654d",
            textColor: "#fff",
            imageUrl: "https://i.livelib.ru/boocover/1001093871/200/ec9a/Mihail_Elizarov__Multiki.jpg",
            description:
"""
В начале девяностых годов прошлого века обычный российский школьник по имени Герман Рымбаев попал под влияние дурной компании. Его жизнь превратилась в череду распутства, беззакония и надругательства над моральными принципами. Вместе с друзьями мальчик, получивший прозвище Рэмбо, проводит дни, прогуливая школу, напиваясь за гаражами, совращая одноклассниц, шантажируя и угрожая честным гражданам с целью заработать немного денег, чтобы приобрести чудеса техники вроде кассетных магнитофонов и электронных часов.\\n\\nВеселая и беззаботная жизнь Германа-Рэмбо обрывается в одночасье, когда он оказывается в детской комнате милиции. Там он знакомится со странным человеком, называющим себя… Разумом Аркадьевичем. Когда-то его звали Алеша Разумовский, но, как и Герман, он пошел по преступной стезе, которая в итоге привела его к жестокому убийству троих мальчишек.\\n\\nАлеше повезло: в его жизни тогда появился наставник, который помог малолетнему преступнику встать на путь добродетели. С тех пор Алеша звал себя не иначе как Разум и поклялся защищать тех, кто сбился с пути. Вот только методы он выбрал слегка... пугающие.
"""
        )
    }

    private func book7() -> Book {
        Book(
            title: "Бураттини. Фашизм прошёл",
            bookType: "Эссе",
            year: "2011",
            backgroundColor: "#c2a6a7",
            textColor: "#222",
            imageUrl: "https://s1.livelib.ru/boocover/1000488263/o/ea9b/Mihail_Elizarov__Burattini._Fashizm_proshel.jpeg",
            description:
"""
\\"Было бы ошибкой воспринимать \\"Бураттини\\" как эссеистику в чистом виде. Перед вами, скорее, монологи персонажей из ненаписанного романа. Герои язвят и философствуют, потом совершают какие-нибудь абсурдные, провокационные поступки - в обычном романе это называется сюжетом. Поступки, собственно, остались \\"за кадром\\", поэтому читателю предлагается совершать их самостоятельно, по мере прочтения\\". (Михаил Елизаров)\\n\\n\\"Буратино - неунывающий деревянный организм, лидер и оратор, человек действия, циник, презирающий образование и декадентство. Для него не существует женщины, и при этом он - воплощение потентности. Вечно эрегированный нос Буратино - символ его мужской состоятельности. Буратино смел, весел, беспринципен и при этом - неистребимо обаятелен\\".
"""
        )
    }

    private func book8() -> Book {
        Book(
            title: "Мы вышли покурить на 17 лет...",
            bookType: "Сборник рассказов",
            year: "2012",
            backgroundColor: "#626d6c",
            textColor: "#fff",
            imageUrl: "https://j.livelib.ru/boocover/1000565906/200/7a1e/Mihail_Elizarov__My_vyshli_pokurit_na_17_let..._sbornik.jpg",
            description:
"""
Перед вами сборник, состоящий из зарисовок, жизненных историй и образов. Как говорит сам автор, Михаил Елизаров, все сюжеты и персонажи вымышлены, а «в книге нет ни слова правды».\\n\\nТем не менее, автор открывает читателю очень жизненные и реалистичные истории самых разных людей. Вот семейная пара, где обоим уже за сорок, лучшие годы позади, а счастливое будущее все еще не наступило. А вот гастарбайтер, у которого просрочена рабочая виза. Единственное, что его волнует, – чтобы этого не заметили на таможне. А здесь местная «качалка», в которой собирается простой люд, местные рэкетиры и всякий сброд.\\n\\n«Мы вышли покурить на 17 лет…» – это истории уникальной эпохи, восьмидесятых и девяностых годов. Михаил Елизаров удачно преподносит читателю сюжеты и героев, в которых тот обязательно узнает себя.
"""
        )
    }

    private func book9() -> Book {
        Book(
            title: "Земля",
            bookType: "Роман",
            year: "2020",
            backgroundColor: "#b49785",
            textColor: "#222",
            imageUrl: "https://upload.wikimedia.org/wikipedia/ru/thumb/2/21/Zemlya.jpg/262px-Zemlya.jpg",
            description:
"""
В своем новом романе «Земля» Михаил Елизаров рассказывает о Кроте, «русском Танатосе», а другими словами – мастере похоронного дела. Его зовут Кротышев Владимир Сергеевич, и с самого раннего детства в его жизни присутствует смерть. Ее символы постоянно преследуют Крота, а когда он начинает заниматься похоронным делом, то сам становится олицетворением смерти.\\n\\nНа эту тему автор говорит, балансируя между серьезным и несерьезным, но при этом не использует экзистенциальные идеи и похоронные байки. Смерть он рассматривает со всех сторон: от лица ребенка, с точки зрения суеверий и оккультизма, сурового похоронного бизнеса и философии.\\n\\n«Земля» – это первая часть цикла. Книга дает возможность взглянуть на смерть совсем другими глазами.\\n\\nКнига содержит нецензурную брань и предназначена для совершеннолетних читателей.
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
