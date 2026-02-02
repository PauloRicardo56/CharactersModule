//
//  CharacterViewModel.swift
//  Characters
//
//  Created by Paulo Vieira on 02/02/26.
//

import Foundation

@MainActor
final class CharacterViewModel: ObservableObject {
    
    @Published var characters = [Character]()
    private let repository: CharacterRepositoryProtocol
    
    init(repository: CharacterRepositoryProtocol = CharacterRepositoryMock()) {
        self.repository = repository
    }
    
    func fetchAllCharacters() async {
        do {
            let response = try await repository.getAllCharacters()
            characters = response.results
        } catch {
            
        }
    }
}
