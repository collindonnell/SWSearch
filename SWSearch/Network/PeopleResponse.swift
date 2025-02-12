//
//  PeopleResponse.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

struct PeopleResponse: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Person]
}
