//
//  Service.swift
//  Digio
//
//  Created by Martha R on 16/11/2020.
//  Copyright © 2020 Martha Salomão de Moraes. All rights reserved.
//

import Foundation

class Service {
    func request<T: Codable>(router: Router, completion: @escaping (Result<T>) -> ()) {
        
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                completion(.failure(CustomError.network))
                return
            }
            
            guard response != nil else {
                completion(.failure(CustomError.api))
                return
            }
            
            guard let data = data else {
                completion(.failure(CustomError.unknown))
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(object))
                }
            } catch {
                completion(.failure(CustomError.parse))
            }
        }
        
        dataTask.resume()
    }
}
