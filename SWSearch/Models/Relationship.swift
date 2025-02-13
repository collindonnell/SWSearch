//
//  Relationship.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/12/25.
//

import Foundation

struct Relationship<T: Decodable & Equatable & Hashable>: Decodable, Equatable, Hashable {
    let urls: [URL]
    var objects: [T]? = nil

    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.urls = try container.decode([URL].self)
    }
}
