//
//  HomeManager.swift
//  RickAndMorty
//
//  Created by mert polat on 18.03.2023.
//

import Foundation


protocol HomeManagerProtocol {
    func getCatagoryMovies(complete:@escaping((Main?,Error?)->()))
}

class HomeManager{
    static let shared = HomeManager()
    
    func getLocations(complete:@escaping((Main?,Error?)->())){
        NetworkManager.shared.request(type: Main.self,
                                      url: HomeEndpoint.location.path,
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

