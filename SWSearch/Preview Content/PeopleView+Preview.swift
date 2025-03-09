//
//  PeopleView+Preview.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/11/25.
//

import Foundation
import SwiftUI

extension PeopleView {
    static var preview: some View {
        PeopleView(viewModel: CollectionViewModel<Person>(apiClient: MockAPIClient(), initialEndpoint: APIEndpoint.people.url))
    }
}
