//
//  MetricValueFormatter.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/21/25.
//

import Foundation

/// Formats a numeric value (in cm for length, kg for mass) into a localized measurement string.
struct MetricValueFormatter {
    enum MeasurementType {
        case height
        case mass
    }

    static func format(_ value: Double, unitType: MeasurementType) -> String {
        switch unitType {
        case .height:
            return lengthFormatter.string(fromMeters: value / 100)
        case .mass:
            let measurement = Measurement(value: value, unit: UnitMass.kilograms)
            return massFormatter.string(from: measurement)
        }
    }

    // MARK: - Private

    static private let lengthFormatter: LengthFormatter = {
        let formatter = LengthFormatter()
        formatter.unitStyle = .medium
        formatter.isForPersonHeightUse = true
        formatter.numberFormatter.maximumFractionDigits = 0
        return formatter
    }()

    static private let massFormatter: MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .naturalScale
        formatter.numberFormatter.maximumFractionDigits = 1
        formatter.locale = Locale.current
        return formatter
    }()
}
