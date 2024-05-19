//
//  Error.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import Foundation

enum NetworkError: Error {
    case invalidUrl
    case unknown
    case serverError(URLResponse)
    case decodeFailed(Error?)
}

extension URLSession {
    static func validateResponse(_ request: URLRequest, _ response: URLResponse, data: Data?, decoder: JSONDecoder) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknown
        }
        guard 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(httpResponse)
        }
    }
}
