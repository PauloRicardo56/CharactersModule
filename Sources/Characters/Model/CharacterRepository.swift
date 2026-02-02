//
//  CharacterRepository.swift
//  Characters
//
//  Created by Paulo Vieira on 02/02/26.
//

import Foundation
import Domain

protocol CharacterRepositoryProtocol: Sendable {
    func getAllCharacters() async throws -> CharacterResponse
}

final class CharacterRepository: CharacterRepositoryProtocol {
    
    private let network: NetworkProtocol
    
    init(network: NetworkProtocol = Network()) {
        self.network = network
    }
    
    func getAllCharacters() async throws -> CharacterResponse {
        let data = try await network.fetch(from: URL(string: "https://rickandmortyapi.com/api/character"))
        let response = try JSONDecoder().decode(CharacterResponse.self, from: data)
        return response
    }
}

final class CharacterRepositoryMock: CharacterRepositoryProtocol {
    func getAllCharacters() async throws -> CharacterResponse {
        guard let jsonUrl = Bundle.module.url(forResource: "Character", withExtension: "json")
        else { throw RepositoryError.badMock }
        
        let data = try Data(contentsOf: jsonUrl)
        let character = try JSONDecoder().decode(Character.self, from: data)
        return CharacterResponse(info: Info(count: 0, pages: 0, next: nil, prev: nil), results: [character])
    }
}

enum RepositoryError: Error {
    case badMock
}
