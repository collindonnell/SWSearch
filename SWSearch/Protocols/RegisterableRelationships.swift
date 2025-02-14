//
//  RegisterableRelationships.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/13/25.
//

import Foundation

protocol AnyRelationship {
    var name: String { get }
}

/// Type-erased wrapper for Relationship<T>
struct AnyRelationshipWrapper<T: RelationshipElement>: AnyRelationship {
    let name: String
    let relationship: Relationship<T>
}

/// Protocol for models that register relationships dynamically
protocol RegisterableRelationships {
    func registeredRelationships() -> [AnyRelationship]
}
