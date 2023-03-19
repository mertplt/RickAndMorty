//
//  MainViewModel.swift
//  RickAndMorty
//
//  Created by mert polat on 18.03.2023.
//

import Foundation


class MainViewModel{
    let manager = HomeManager.shared
    
    var main: Main?
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
    
    func numberOfItems() -> Int{
        main?.results?.count ?? 0
    }
}
 
