//
//  NetworkManager.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import Foundation

protocol NetworkManagerProtocol {
    func executeGetRequest<T: Decodable>(address: Address) async throws -> T
}

typealias DataResult = (data: Data, response: URLResponse)


class NetworkManager: NetworkManagerProtocol {
    
    func executeGetRequest<T: Decodable>(address: Address) async throws -> T {
        do {
            let request = try makeRequest(endPoint: EndPoint(address: address))
            
            let result: DataResult = try await URLSession.shared.data(for: request)
            try URLSession.validateResponse(request,
                                            result.response,
                                            data: result.data,
                                            decoder: JSONDecoder())
            
            let model = try JSONDecoder().decode(NetworkResponse<T>.self, from: result.data).result
            return model
            
        } catch let error as DecodingError {
            throw NetworkError.decodeFailed(error)
            
        } catch {
            throw NetworkError.unknown
        }
    }
    
    func makeRequest(endPoint: EndPoint) throws ->  URLRequest {
        
        guard let url = URL(string: endPoint.address.urlPath ?? "") else {
            throw NetworkError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return request
    }
}
