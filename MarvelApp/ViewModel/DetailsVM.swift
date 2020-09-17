//
//  DetailsVM.swift
//  MarvelApp
//
//  Created by zeynep tokcan on 17.09.2020.
//  Copyright © 2020 zeynep tokcan. All rights reserved.
//

import Foundation

class DetailsVM {
    var character: CharacterResults?
    
    init(character: CharacterResults) {
        self.character = character
    }
    
    func getCharacterName() -> String? {
        return character?.name
    }
    func getCharacterImage() -> String {
        let path = character?.thumbnail?.path ?? ""
        let ext = character?.thumbnail?.extenSion ?? ""
        return path + "." + ext
    }
    func getCharacterDesc() -> String? {
        return character?.description
    }
    func getCharacterComicsList() -> [Items] {
        return (character?.comics?.items)!
    }
    func getComics(atIndex: Int) -> String {
        return (character?.comics?.items?[atIndex].name)!
    }
    
   // private func publisingDate() ->
    
    var count: Int? {
        return character?.comics?.available
    }
}
