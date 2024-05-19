//
//  Injection.swift
//  NYTimes
//
//  Created by Amjad Almuwallad on 17/05/2024.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        defaultScope = .graph
        
        register {
            NetworkManager()
        }.implements(NetworkManagerProtocol.self)
        
        registerDataRepository()
    }
    
    private static func registerDataRepository() {
        register {
            DataRepo.RemoteDataRepo()
        }
        .implements(DataRepository.self)
        
        register {
            DataRepo()
        }
    }
}
