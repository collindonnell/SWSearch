//
//  APIClient.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

final class SWAPIClient: APIClient {
    private let session: URLSession

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetch<T: Decodable>(from url: URL) async throws -> T {
        let data = try await fetchData(from: url)
        return try decoder.decode(T.self, from: data)
    }

    func fetch<T: Decodable>(from urls: [URL]) async throws -> [T] {
        try await withThrowingTaskGroup(of: T.self) { group in
            for url in urls {
                group.addTask {
                    return try await self.fetch(from: url)
                }
            }
            var results = [T]()
            for try await result in group {
                results.append(result)
            }
            return results
        }
    }

    private func fetchData(from url: URL) async throws -> Data {
        let (data, _) = try await session.data(from: url)
        return data
    }
}
