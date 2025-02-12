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
        List(viewModel.people) { person in
            Text(person.name)
                .onAppear {
                    if person == viewModel.people.last {
                        Task {
                            await viewModel.fetchNextPage()
                        }
                    }
                }
        }
        .task {
            await viewModel.fetchNextPage()
        }
    }
}

#Preview {
    PeopleView.preview
}
