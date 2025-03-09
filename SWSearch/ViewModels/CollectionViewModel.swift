//
//  PeopleViewModel.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

@Observable
final class CollectionViewModel<Item: Decodable>: ErrorMessageable {
    @MainActor var items: [Item] = []
    @MainActor var selection: Item?
    @MainActor var errorMessage: String?

    private let apiClient: APIClient
    private var isLoading: Bool = false
    private var nextPageURL: URL?

    init(apiClient: APIClient = .live, initialEndpoint: URL) {
        self.apiClient = apiClient
        self.nextPageURL = initialEndpoint
    }

    func fetchNextPage() async {
        guard let nextPageURL, !isLoading else { return }
        isLoading = true
        defer { isLoading = false }

        do {
            let response: CollectionResponse<Item> = try await apiClient.fetch(from: nextPageURL)
            let fetchedItems = response.results
            self.nextPageURL = response.next
            await MainActor.run {
                items.append(contentsOf: fetchedItems)
            }
        } catch {
            await MainActor.run { errorMessage = error.localizedDescription }
            Logging.networking.error("Failed to fetch items: \(error)")
        }
    }
}

// Factory method to create a people view model
extension CollectionViewModel where Item == Person {
    static func forPeople(apiClient: APIClient = .live) -> CollectionViewModel<Person> {
        return CollectionViewModel(apiClient: apiClient, initialEndpoint: APIEndpoint.people.url)
    }
}
