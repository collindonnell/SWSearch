//
//  PeopleViewModelTests.swift
//  SWSearchTests
//
//  Created by Collin Donnell on 2/11/25.
//

import Testing
@testable import SWSearch
struct PeopleViewModelTests {

    @Test func testLoadsInitialResponse() async throws {
        let viewModel = PeopleViewModel(apiClient: .mock)
        await viewModel.fetchNextPage()
        await #expect(viewModel.people.count > 0)
    }

    @Test func testLoadsRelationships() async throws {
        let viewModel = PeopleViewModel(apiClient: .mock)
        await viewModel.fetchNextPage()
        let person = await viewModel.people.first!
        #expect(person.films.urls.count > 0)
    }
}
