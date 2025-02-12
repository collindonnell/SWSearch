//
//  Logging.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation
import OSLog

struct Logging {
    static let subsystem = Bundle.main.bundleIdentifier ?? "com.collindonnell.SWSearch"
    static let networking = Logger(subsystem: subsystem, category: "networking")
}
