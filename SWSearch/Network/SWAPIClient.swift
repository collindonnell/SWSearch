//
//  APIClient.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

final class SWAPIClient: APIClient {
    private let session: URLSession
    private let baseURL = URL(string: "https://swapi.dev/api/")!

    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetch<T: Decodable>(from path: String) async throws -> T {
        let url = self.url(for: path)
        let data = try await fetchData(from: url)
        return try decoder.decode(T.self, from: data)
    }

    private func fetchData(from url: URL) async throws -> Data {
        let (data, _) = try await session.data(from: url)
        return data
    }

    private func url(for path: String) -> URL {
        baseURL.appendingPathComponent(path)
    }
}
