//
//  CollectionViewModel.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/17/25.
//

import Foundation

protocol CollectionViewModel {
    associatedtype Item
    var items: [Item] { get }
    var errorMessage: String? { get set }
    func fetchNextPage() async
}
