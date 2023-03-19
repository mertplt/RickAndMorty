//
//  NetworkManager.swift
//  RickAndMorty
//
//  Created by mert polat on 18.03.2023.
//

import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type,
                             url: String,
                             method: HTTPMethod,
                             completion: @escaping((Result<T, ErrorTypes>)->())) {
        AF.request(url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "", method: method).responseData { response in
            switch response.result {
            case .success(let data):
                self.handleResponse(data: data) { response in
                    completion(response)
                }
            case .failure(let _):
                completion(.failure(.generalError))
            }
        }
    }
    
    fileprivate func handleResponse<T: Codable>(data: Data,completion: @escaping((Result<T, ErrorTypes>)->())){
        do{
            let result = try JSONDecoder().decode(T.self, from: data)
            completion(.success(result))
        }
        catch{
            completion(.failure(.invalidData))
        }
    }

    
}
