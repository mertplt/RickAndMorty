//
//  MainModel.swift
//  RickAndMorty
//
//  Created by mert polat on 18.03.2023.
//

import Foundation

// MARK: - Main
struct Main: Codable {
    let info: Info?
    let results: [MainResult]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
}

// MARK: - Result
struct MainResult:  Identifiable,Codable,LocationCellProtocol {
    let id: Int
    let name, type, dimension: String
    let residents: [String]
    let url: String
    
    var locationText: String{
        name ?? ""
    }
    
    var CharacterLinks: [String]{
        residents
    }
    
}
