//
//  ContentView.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import SwiftUI

struct PeopleView: View {
    @State private var viewModel: CollectionViewModel<Person>
    
    init(viewModel: CollectionViewModel<Person> = CollectionViewModel.forPeople()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.items) { person in
            NavigationLink(value: person, label: {
                Text(person.name)
                    .onAppear {
                        if person == viewModel.items.last {
                            Task {
                                await viewModel.fetchNextPage()
                            }
                        }
                    }
            })
        }
        .navigationTitle("People")
        .navigationDestination(for: Person.self) { person in
            PersonView(person: person)
        }
        .task {
            await viewModel.fetchNextPage()
        }
    }
}

#Preview {
    PeopleView.preview
}
