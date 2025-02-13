//
//  PeopleViewModel.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

@Observable
final class PeopleViewModel: ErrorMessageable {
    @MainActor var people: [Person] = []
    @MainActor var selection: Person?
    @MainActor var errorMessage: String?

    private let apiClient: APIClient
    private var isLoading: Bool = false
    private var nextPageURL: URL? = APIEndpoint.people.url

    init(apiClient: APIClient = .live) {
        self.apiClient = apiClient
    }
    
    func fetchNextPage() async {
        guard let nextPageURL, !isLoading else { return }

        isLoading = true
        defer { isLoading = false }

        do {
            let response: PeopleResponse = try await apiClient.fetch(from: nextPageURL)
            let fetchedPeople = response.results
            self.nextPageURL = response.next
            await MainActor.run {
                people.append(contentsOf: fetchedPeople)
            }
        } catch {
            await MainActor.run { errorMessage = error.localizedDescription }
            Logging.networking.error("Failed to fetch people: \(error)")
        }
    }
}
