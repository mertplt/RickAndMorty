//
//  CharacterManager.swift
//  RickAndMorty
//
//  Created by mert polat on 23.03.2023.
//

import Foundation

protocol CharacterManagerProtocol {
    func getCharacters(complete:@escaping((CharacterElement?,Error?)->()))
}

class CharacterManager{
    static let shared = CharacterManager()
    
    func getCharacters(complete:@escaping((CharacterElement?,Error?)->())){
        NetworkManager.shared.request(type: CharacterElement.self,
                                      url: CharacterEndpoint.character.path,
                                      method:.get) { response in
            switch response{
            case .success(let data):
                complete(data,nil)
            case .failure(let error):
                complete(nil,error)
            }
        }
    }
}
