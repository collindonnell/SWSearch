//
//  RootView.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import SwiftUI

struct RootView: View {
    @State private var peopleViewModel: PeopleViewModel

    init(peopleViewModel: PeopleViewModel = .init(apiClient: .live)) {
        _peopleViewModel = .init(initialValue: peopleViewModel)
    }

    var body: some View {
        NavigationSplitView {
            PeopleView(viewModel: peopleViewModel)
                .navigationTitle("People")
        } detail: {
            Text(peopleViewModel.selection?.name ?? "Select a person")
        }

    }
}

#Preview {
    RootView(peopleViewModel: PeopleViewModel(apiClient: .mock))
}
