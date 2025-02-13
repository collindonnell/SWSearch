//
//  Film.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/12/25.
//

import Foundation

struct Film: Identifiable, Decodable, Equatable, Hashable {
    var title: String
    var url: String
    var id: String { url }
}
