//
//  PersonViewModel.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/13/25.
//

import Foundation

@Observable
final class PersonViewModel {
    var person: Person

    init(person: Person) {
        self.person = person
    }

    var details: [(label: String, value: String)] {
        [
            ("Name", person.name),
            ("Hair Color", person.hairColor),
            ("Skin Color", person.skinColor),
            ("Eye Color", person.eyeColor),
            ("Birth Year", person.birthYear),
            ("Gender", person.gender),
            ("Height", formattedHeight),
            ("Mass", formattedMass)
        ]
    }

    var formattedHeight: String {
        guard let height = person.heightInCm else { return "n/a" }
        return formatMeasurement(height, unit: UnitLength.centimeters)
    }

    var formattedMass: String {
        guard let mass = person.massInKg else { return "n/a" }
        return formatMeasurement(mass, unit: UnitMass.kilograms)
    }

    func loadRelationships() async throws {
//        for wrapper in person.registeredRelationships() {
//            
//        }
    }

    private func formatMeasurement<T: Unit>(_ value: Double, unit: T) -> String {
        if unit is UnitLength {
            let formatter = LengthFormatter()
            formatter.unitStyle = .medium
            formatter.isForPersonHeightUse = true
            formatter.numberFormatter.maximumFractionDigits = 0
            return formatter.string(fromMeters: value / 100)
        }
        let measurement = Measurement(value: value, unit: unit)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .naturalScale
        formatter.numberFormatter.maximumFractionDigits = 1
        formatter.locale = Locale.current
        return formatter.string(from: measurement)
    }
}
