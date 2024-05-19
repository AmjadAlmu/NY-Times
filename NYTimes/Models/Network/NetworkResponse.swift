//
//  NetworkResponse.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import Foundation

struct NetworkResponse<Wrapped: Decodable>: Decodable {
    var result: Wrapped
    
    private enum CodingKeys: CodingKey {
        case result
    }
    
    init(from coder: Decoder) throws {
        do {
            let container = try coder.container(keyedBy: CodingKeys.self)
            self.result = try container.decode(Wrapped.self, forKey: .result)
        }
        catch {
            let container = try coder.singleValueContainer()
            self.result = try container.decode(Wrapped.self)
        }
    }
}
