//
//  HomeHelper.swift
//  RickAndMorty
//
//  Created by mert polat on 18.03.2023.
//

import Foundation

enum HomeEndpoint: String {
    case location = "location"
    
    var path: String {
        switch self{
        case.location:
            return NetworkHelper.shared.requestUrl(url:HomeEndpoint.location.rawValue)
        }
    }
}
