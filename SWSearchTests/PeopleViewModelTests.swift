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

}
