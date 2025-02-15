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
        List {
            ForEach(viewModel.details, id: \.label) { detailField in
                LabeledContent(detailField.label, value: detailField.value)
            }
            Section("Films") {
                Text("hello")
            }
        }
        .navigationTitle(viewModel.person.name)
    }
}

#Preview {
    let json = """
    {
        "films": []
    }
    """.data(using: .utf8)!

    let decoder = JSONDecoder()
    let relationship = try! decoder.decode(Relationship<Film>.self, from: json)

    PersonView(
        person: Person(
            name: "Luke",
            height: "100",
            mass: "100",
            hairColor: "Brown",
            skinColor: "Green",
            eyeColor: "Blue",
            birthYear: "14 BBY",
            gender: "male",
            url: URL(string: "https://swapi.dev")!,
            films: relationship
        )


    )
}
