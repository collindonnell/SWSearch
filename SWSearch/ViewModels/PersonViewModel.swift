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
        return MetricValueFormatter.format(height, unitType: .height)
    }

    var formattedMass: String {
        guard let mass = person.massInKg else { return "n/a" }
        return MetricValueFormatter.format(mass, unitType: .mass)
    }

    func loadRelationships() async throws {
//        for wrapper in person.registeredRelationships() {
//            
//        }
    }
}
