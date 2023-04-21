//
//  MainViewModel.swift
//  RickAndMorty
//
//  Created by mert polat on 18.03.2023.
//

import Foundation


class MainViewModel{
    

    let manager = HomeManager.shared
    let characterManager = CharacterManager.shared
    
    
    var main: Main?
    var character: CharacterElement?
    var errorCallBack: ((String)->())?
    var successCallBack: (()->())?
    
    func getLocationItems(){
        manager.getLocations { [weak self ]Main, error in
            if let error = error{
                self?.errorCallBack?(error.localizedDescription)

            }else{
                self?.main = Main
                self?.successCallBack?()
            }
        }
    }
    
    
    func getCharacterItems(){
        characterManager.getCharacters { [weak self ]CharacterElement, error in
            if let error = error{
                self?.errorCallBack?(error.localizedDescription)

            }else{
                self?.character = CharacterElement
                self?.successCallBack?()
            }
        }
    }

    
    func numberOfItems() -> Int{
        main?.results?.count ?? 0
    }
    
    func nubmerOfCharacterItems() -> Int{
        print("Karakter Sayısı: \([character].count)")
        return [character].count ?? 3
    }

    
    func generateCharacterLinks(from url: String) -> String {
        var characterIds = [String]()

        // get all character ids from residents urls
        if let url = URL(string: url),
           let data = try? Data(contentsOf: url),
           let location = try? JSONDecoder().decode(SingleLocation.self, from: data) {

            for resident in location.residents ?? [] {
                if let characterId = resident.components(separatedBy: "/").last {
                    characterIds.append(characterId)
                }
            }
        }

        let characterIdsString = characterIds.joined(separator: ",")

        let link = "https://rickandmortyapi.com/api/character/\(characterIdsString)"

        return link
    }
    
    
 
    
  

}
 
