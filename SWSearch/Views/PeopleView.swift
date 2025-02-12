//
//  ContentView.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import SwiftUI

struct PeopleView: View {
    @State private var viewModel: PeopleViewModel

    init(viewModel: PeopleViewModel = PeopleViewModel(apiClient: SWAPIClient())) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(viewModel.people, selection: $viewModel.selection) { person in
            NavigationLink(value: person, label: {
                Text(person.name)
                    .onAppear {
                        if person == viewModel.people.last {
                            Task {
                                await viewModel.fetchNextPage()
                            }
                        }
                    }
            })
        }
        .listStyle(SidebarListStyle())
        .task {
            await viewModel.fetchNextPage()
        }
    }
}

#Preview {
    PeopleView.preview
}
