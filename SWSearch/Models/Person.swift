//
//  Person.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

struct Person: Identifiable, Equatable, Decodable {
    let name: String
    let height: String
    let mass: String
    let url: String

    var id: String {
        url.components(separatedBy: "/").filter { !$0.isEmpty }.last!
    }
}
