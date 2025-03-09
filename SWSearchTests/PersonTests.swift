//
//  CollectionViewModelTests.swift
//  SWSearchTests
//
//  Created by Collin Donnell on 2/18/25.
//

import Testing
import Foundation

@testable import SWSearch

struct PersonTests {
    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    private var personData: Data = {
        let url = Bundle.main.url(forResource: "Person", withExtension: "json")!
        return try! Data(contentsOf: url)
    }()

    private let person: Person

    init() {
        self.person = try! decoder.decode(Person.self, from: self.personData)
    }

    @Test("Correctly decodes basic properties")
    func decodesFromJSON() async throws {
        #expect(person.name == "Luke Skywalker")
        #expect(person.birthYear == "19BBY")
        #expect(person.id == "1")
    }

    @Test("Returns correct mass and height values")
    func bodyMeasurementValues() async throws {
        #expect(person.mass == "77")
        #expect(person.massInKg == 77)
        #expect(person.height == "172")
        #expect(person.heightInCm == 172)
    }

    @Test("Decodes registered relationships")
    func decodesRelationships() async throws {
        #expect(person.registeredRelationships().count > 0)
        #expect(person.registeredRelationships().first?.name == "Films")
    }
}
