//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by mert polat on 23.03.2023.
//

import Foundation


// MARK: - WelcomeElement
struct CharacterElement: Identifiable,Codable,CharacterCellProtocol {
    let id: Int?
        let name: String?
        let status: String?
        let species: String?
        let type: String?
        let gender: String?
        let origin: CharacterOrigin?
        let location: CharacterLocation?
        let image: String?
        let episode: [String]?
        let url: String?
        let created: String?
    
    var nameText :String{
        name ?? ""
    }
    
    var genderText: String{
        gender ?? ""
    }
    var posterImage: String{
        image ?? ""
    }
    
    
}

// MARK: - Location
struct CharacterOrigin: Codable {
    let name: String?
    let url: String?
}

struct CharacterLocation: Codable {
    let name: String?
    let url: String?
}
    typealias Character = [CharacterElement]
