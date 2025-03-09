//
//  RootView.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import SwiftUI

struct RootView: View {
    @State private var peopleViewModel: CollectionViewModel<Person>
    @State private var columnVisiblity = NavigationSplitViewVisibility.all
    
    init(peopleViewModel: CollectionViewModel<Person> = CollectionViewModel.forPeople()) {
        _peopleViewModel = .init(initialValue: peopleViewModel)
    }
    
    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisiblity) {
            PeopleView(viewModel: peopleViewModel)
        } detail: {
            Text("No Selection")
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    RootView(peopleViewModel: CollectionViewModel<Person>(apiClient: .mock, initialEndpoint: APIEndpoint.people.url))
}
