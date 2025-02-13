//
//  Relationship.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/12/25.
//

import Foundation

struct Relationship<T: Decodable & Equatable & Hashable & Identifiable>: Decodable, Equatable, Hashable {
    enum State: Hashable {
        case unloaded
        case loading
        case loaded([T])
        case failed
    }

    var state: State = .unloaded
    let urls: [URL]

    init(from decoder: any Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.urls = try container.decode([URL].self)
    }
}

// MARK: Loading
extension Relationship {
    mutating func loadObjects(using loader: RelationshipLoader = .init(apiClient: .live)) async throws {
        guard case .unloaded = state else { return }

        state = .loading

        do {
            let results = try await loader.fetchObjects(for: self)
            state = .loaded(results)
        } catch {
            state = .failed
        }
    }
}
