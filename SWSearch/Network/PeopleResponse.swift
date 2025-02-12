//
//  PeopleResponse.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

struct PeopleResponse: Decodable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Person]
}
