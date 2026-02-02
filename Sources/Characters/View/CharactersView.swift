//
//  CharactersView.swift
//  Characters
//
//  Created by Paulo Vieira on 02/02/26.
//

import Foundation
import SwiftUI

public struct CharactersView: View {
    
    @StateObject var viewModel = CharacterViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List(viewModel.characters, id: \.id) { character in
                HStack {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(character.name)
                }
            }
            .task {
                await viewModel.fetchAllCharacters()
            }
        }
    }
}

#Preview {
    CharactersView()
}
