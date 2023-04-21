//
//  NetworkHelper.swift
//  RickAndMorty
//
//  Created by mert polat on 18.03.2023.
//


import Foundation


enum  HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}
enum    ErrorTypes: String,Error{
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}


class NetworkHelper{
    static let shared = NetworkHelper()
    
    let baseURL = "https://rickandmortyapi.com/api/"
    
    func requestUrl(url:String)->String{
      print(baseURL + url)

       return baseURL + url
    }
    
    
}
