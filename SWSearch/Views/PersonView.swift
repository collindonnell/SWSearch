//
//  PersonView.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/12/25.
//

import SwiftUI

struct PersonView: View {
    private var viewModel: PersonViewModel

    init(person: Person) {
        viewModel = .init(person: person)
    }

    var body: some View {
        Text(viewModel.person.name)
            .navigationTitle("Person")
    }
}

#Preview {
    PersonView(person: Person(name: "Luke", height: "100", mass: "100", url: "https://swapi.dev", films: nil))
}
