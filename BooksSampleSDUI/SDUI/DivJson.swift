//
//  DivJson.swift
//  BooksSampleSDUI
//
//  Created by Maksim Ivanov on 26.04.2023.
//

import Foundation
import DivKit
import Serialization

struct DivJson: Deserializable {
    let templates: [String: Any]
    let cards: [[String: Any]]

    init(dictionary: [String: Any]) throws {
        templates = try dictionary.getOptionalField("templates") ?? [:]
        cards = try dictionary.getArray("cards")
    }

    static func loadCards(_ data: Data) throws -> [DivData] {
        let divJson = try DivJson(JSONData: data)
        return divJson.cards.compactMap {
            DivData.resolve(
                card: $0,
                templates: divJson.templates
            ).value
        }
    }
}
