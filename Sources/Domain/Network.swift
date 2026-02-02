//
//  Network.swift
//  Characters
//
//  Created by Paulo Vieira on 02/02/26.
//

import Foundation

public protocol NetworkProtocol: Sendable {
    func fetch(from url: URL?) async throws -> Data
}

public final class Network: NetworkProtocol {
    
    public init() {}
    
    public func fetch(from url: URL?) async throws -> Data {
        guard let url = url else { throw NetworkError.badURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NetworkError.badResponse }
        
        return data
    }
}

enum NetworkError: Error {
    case badURL, badResponse
}
