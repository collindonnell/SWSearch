//
//  APIEndpoint.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

enum APIEndpoint {
    case people

    static let baseURL = URL(string: "https://swapi.dev/api/")!

    var url: URL {
        switch self {
            case .people:
            return APIEndpoint.baseURL.appendingPathComponent("people")
        }
    }
}
