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

    @Test("Formats localized human height string from centimeters")
    func testHeightFormattingFromCentimeters() async throws {
        let formattedHeight = MetricValueFormatter.format(172, unitType: .height)
        if Locale.current.measurementSystem == .metric {
            #expect(formattedHeight.contains("cm"))
        } else {
            #expect(formattedHeight.contains("ft") || formattedHeight.contains("in"))
        }
        #expect(!formattedHeight.contains("yd"))
    }

    @Test("Formats localized human mass string from kilograms")
    func testMassFormattingFromKilograms() async throws {
        let formattedMass = MetricValueFormatter.format(72, unitType: .mass)
        if Locale.current.measurementSystem == .metric {
            #expect(formattedMass.contains("kg"))
        } else {
            #expect(formattedMass.contains("lb"))
        }
    }
}
