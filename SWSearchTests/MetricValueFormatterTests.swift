//
//  MetricValueFormatterTests.swift
//  SWSearchTests
//
//  Created by Collin Donnell on 2/21/25.
//

import Testing
import Foundation
@testable import SWSearch

struct MetricValueFormatterTests {

    @Test func testLengthFormattingFromCentimeters() async throws {
        let formattedHeight = MetricValueFormatter.format(172, unitType: .height)
        if Locale.current.measurementSystem == .metric {
            #expect(formattedHeight.contains("cm"))
        } else {
            #expect(formattedHeight.contains("ft") || formattedHeight.contains("in"))
        }
        #expect(!formattedHeight.contains("yd"))
    }
}
