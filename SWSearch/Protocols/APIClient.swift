//
//  APIClient.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

protocol APIClient {
    func fetch<T: Decodable>(from url: URL) async throws -> T
}

extension APIClient where Self == SWAPIClient {
    static var live: APIClient { SWAPIClient() }
}

extension APIClient where Self == MockAPIClient {
    static var mock: APIClient { MockAPIClient() }
}
