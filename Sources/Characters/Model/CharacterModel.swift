//
//  CharacterModel.swift
//  Characters
//
//  Created by Paulo Vieira on 02/02/26.
//

import Foundation

struct CharacterResponse: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    static let fake = Character(id: 1, name: "Character Name", status: "Alive", species: "Human", type: "Human Type", gender: "Male", origin: .fake, location: .fake, image: "", episode: [], url: "", created: "1995")
}

struct Origin: Codable {
    let name: String
    let url: String
    
    static let fake = Origin(name: "Brazil", url: "")
}

struct Location: Codable {
    let name: String
    let url: String
    
    static let fake = Location(name: "Brasilia", url: "")
}
