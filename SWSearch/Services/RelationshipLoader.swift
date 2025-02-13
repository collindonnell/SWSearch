//
//  RelationshipLoader.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/12/25.
//

import Foundation

actor RelationshipLoader {
    let apiClient: APIClient

    init(apiClient: APIClient = .live) {
        self.apiClient = apiClient
    }

    func fetchObjects<T: Decodable & Identifiable>(for relationship: Relationship<T>) async throws -> [T] {
        let objects: [T] = try await apiClient.fetch(from: relationship.urls)
        return objects
    }
}
