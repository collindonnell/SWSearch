//
//  PeopleViewModel.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation

@Observable
class PeopleViewModel: ErrorMessageable {
    @MainActor var people: [Person] = []
    @MainActor var errorMessage: String?
    private let apiClient: APIClient
    
    init(apiClient: APIClient = SWAPIClient()) {
        self.apiClient = apiClient
    }
    
    func fetchAll() async {
        do {
            let response: PeopleResponse = try await apiClient.fetch(from: "/people")
            let fetchedPeople = response.results
            await MainActor.run {
                people = fetchedPeople
            }
        } catch {
            await MainActor.run { errorMessage = error.localizedDescription }
            Logging.networking.error("Failed to fetch people: \(error)")
        }
    }
}
