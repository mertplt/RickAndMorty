//
//  SingleLocationModel.swift
//  RickAndMorty
//
//  Created by mert polat on 24.03.2023.
//

import Foundation

// MARK: - Welcome
struct SingleLocation: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
}
