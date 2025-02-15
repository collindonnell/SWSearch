//
//  Person.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

struct Person: RegisterableRelationships, Identifiable, Equatable, Decodable, Hashable {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let url: URL
    let films: Relationship<Film>

    var heightInCm: Double? { Double(height) }
    var massInKg: Double? { Double(mass) }

    var id: String {
        url.absoluteString.components(separatedBy: "/").filter { !$0.isEmpty }.last!
    }

    func registeredRelationships() -> [any AnyRelationship] {
        return [
            AnyRelationshipWrapper(name: "Films", relationship: films)
        ]
    }
}
