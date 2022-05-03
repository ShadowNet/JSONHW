//
//  NetworkManager.swift
//  JSONHW
//
//  Created by Redghy on 5/2/22.
//

 import Foundation

 final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    
    func getPokemonManually() -> Pokemon? {
        guard let path = Bundle.main.path(forResource: "Dragons", ofType: "json") else {
            return nil
        }
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            guard let baseDict = jsonObj as? [String: Any] else { return nil }
            return parsePokemonManually(baseDict: baseDict)
        } catch {
            print(error)
        }
        
        return nil
    }
    
    func parsePokemonManually(baseDict: [String: Any]) -> Pokemon?{
        guard let gameIndecesArr = baseDict["game_indices"] as? [[String: Any]] else { return nil }
        var gameIndeces: [GameIndex] = []
        gameIndecesArr.forEach {
            guard let gameIndex = $0["game_index"] as? Int else { return }
            guard let generationDict = $0["generation"] as? [String: Any] else { return }
            guard let generation = self.createBasicData(dict: generationDict) else { return }
            gameIndeces.append(GameIndex(gameIndex: gameIndex, generation: generation))
        }
        
        guard let pokemojArr = baseDict["pokemon_dragons"] as? [[String: Any]] else { return nil }
        var pok: [pokemon] = []
        pokemojArr.forEach {
            guard let pokemonDict = $0["pokemon"] as? [String: Any] else { return }
            guard let poke = self.createBasicData(dict: pokemonDict) else { return }
            pok.append(pokemon(pokemonD: poke))
        }
        
        
        guard let damageDict = baseDict["damage_relations"] as? [String: Any] else { return nil }
        guard let doubleDamageFromArr = damageDict["double_damage_from"] as? [[String: Any]] else {return nil}
        var returnDoubleDamFromAr: [BasicData] = []
        doubleDamageFromArr.forEach {
            guard let basicData = self.createBasicData(dict: $0) else { return }
            returnDoubleDamFromAr.append(basicData)
            print(returnDoubleDamFromAr)
        }
        
        guard let doubleDamageToArr = damageDict["double_damage_to"] as? [[String: Any]] else {return nil}
        var returnDoubleDamtoAr: [BasicData] = []
        doubleDamageToArr.forEach {
            guard let basicData = self.createBasicData(dict: $0) else { return }
            returnDoubleDamtoAr.append(basicData)
        }
        
        guard let halfDamageFromArr = damageDict["half_damage_from"] as? [[String: Any]] else {return nil}
        var returnhalfDamFromAr: [BasicData] = []
        halfDamageFromArr.forEach {
            guard let basicData = self.createBasicData(dict: $0) else { return }
            returnhalfDamFromAr.append(basicData)
        }
        
        guard let halfDamageToArr = damageDict["half_damage_to"] as? [[String: Any]] else {return nil}
        var returnhalfDamToAr: [BasicData] = []
        halfDamageToArr.forEach {
            guard let basicData = self.createBasicData(dict: $0) else { return }
            returnhalfDamToAr.append(basicData)
        }
        
        guard let noDamageToArr = damageDict["no_damage_to"] as? [[String: Any]] else {return nil}
        var returnNoDamToAr: [BasicData] = []
        noDamageToArr.forEach {
            guard let basicData = self.createBasicData(dict: $0) else { return }
            returnNoDamToAr.append(basicData)
        }
        
        guard let generationDictDragons = baseDict["generation"] as? [String: Any] else { return nil }
        guard let generationOut = self.createBasicData(dict: generationDictDragons) else { return nil }
        
        guard let movesDict = baseDict["move_damage_class"] as? [String: Any] else { return nil }
        guard let movesOut = self.createBasicData(dict: movesDict) else { return nil }
        
        guard let idExp = baseDict["id"] as? Int else { return nil }
        
        guard let nameDragon = baseDict["name"] as? String else { return nil }
    
        return Pokemon(gameIndeces: gameIndeces, dragons: pok, generation: generationOut, idDragon:idExp, moves: movesOut, nameD: nameDragon)
    }
    func createBasicData(dict: [String: Any]) -> BasicData? {
        guard let name = dict["name"] as? String else { return nil }
        guard let url = dict["url"] as? String else { return nil }
        return BasicData(name: name, url: url)
    }
        
 

}

    
