//
//  DetailViewModel.swift
//  SWSearch
//
//  Created by Collin Donnell on 2/17/25.
//

import Foundation

protocol DetailViewModel {
    associatedtype Item
    var item: Item { get }
    var errorMessage: String? { get }
    var details: [(name: String, value: String)] { get }
    func fetchRelationships() async
}
