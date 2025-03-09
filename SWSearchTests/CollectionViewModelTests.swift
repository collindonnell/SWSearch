//
//  CollectionViewModelTests.swift
//  SWSearchTests
//
//  Created by Collin Donnell on 2/11/25.
//

import Testing
@testable import SWSearch

struct CollectionViewModelTests {
    @Test func testLoadsInitialResponse() async throws {
        let viewModel = CollectionViewModel<Person>(apiClient: .mock, initialEndpoint: APIEndpoint.people.url)
        await viewModel.fetchNextPage()  // fetch initial response
        await #expect(viewModel.items.count == 10)
    }

    @Test func testLoadsRelationships() async throws {
        let viewModel = CollectionViewModel<Person>(apiClient: .mock, initialEndpoint: APIEndpoint.people.url)
        await viewModel.fetchNextPage()
        let person = await viewModel.items.first!
        #expect(person.films.urls.count > 0)
    }

    @Test func testLoadsNextPage() async throws {
        let viewModel = CollectionViewModel<Person>(apiClient: .mock, initialEndpoint: APIEndpoint.people.url)
        await viewModel.fetchNextPage()
        await viewModel.fetchNextPage()
        await #expect(viewModel.items.count == 20)
    }
}
