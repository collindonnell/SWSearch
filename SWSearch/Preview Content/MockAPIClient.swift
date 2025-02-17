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

  func fetch<T>(from url: URL) async throws -> T where T: Decodable {
    let filename = url == URL(string: "https://swapi.dev/api/people/?page=2") ? "PeoplePageTwo" : "People"
    let data = try Data(contentsOf: URL(fileURLWithPath: Bundle(for: MockAPIClient.self).path(forResource: filename, ofType: "json")!))
    let response = try decoder.decode(T.self, from: data)
    return response
  }

  func fetch<T>(from urls: [URL]) async throws -> [T] where T: Decodable {
    fatalError("init(urls:) has not been implemented")
  }
}
