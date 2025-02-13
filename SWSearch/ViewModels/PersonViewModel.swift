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
}
