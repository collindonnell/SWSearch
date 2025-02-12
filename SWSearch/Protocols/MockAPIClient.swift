//
//  MockAPIClient.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

class MockAPIClient: APIClient {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    func fetch<T>(from path: String) async throws -> T where T : Decodable {
        let data = try Data(contentsOf: URL(fileURLWithPath: Bundle(for: MockAPIClient.self).path(forResource: "People", ofType: "json")!))
        let response = try decoder.decode(T.self, from: data)
        return response
    }
}
