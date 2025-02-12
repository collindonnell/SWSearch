//
//  PeopleViewModelTests.swift
//  SWSearchTests
//
//  Created by Collin Donnell on 2/11/25.
//

import Testing
@testable import SWSearch
struct PeopleViewModelTests {

    @Test func testLoadsPeopleResponse() async throws {
        let viewModel = PeopleViewModel(apiClient: MockAPIClient())
        await viewModel.fetchAll()
        await #expect(viewModel.people.count > 0)
    }

}
