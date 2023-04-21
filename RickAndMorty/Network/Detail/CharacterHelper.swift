//
//  CharacterHelper.swift
//  RickAndMorty
//
//  Created by mert polat on 23.03.2023.
//

import Foundation

enum CharacterEndpoint: String  {

    case character = "character/10,81,208,226,340,362,375,382,395"

    var path: String {
        switch self{
        case.character:

            return NetworkHelper.shared.requestUrl(url:CharacterEndpoint.character.rawValue)
        }
    }
}


//func CharacterEndpoint(link: String) -> String{
//
//
//    var endPoint = link.replacingOccurrences(of: "https://rickandmortyapi.com/api/", with: "")
//    return NetworkHelper.shared.requestUrl(url: endPoint)
//}


