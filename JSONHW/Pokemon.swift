//
//  Pokemon.swift
//  JSONHW
//
//  Created by Redghy on 5/2/22.
//
import Foundation

  struct Pokemon {
      var gameIndeces: [GameIndex]
      var dragons: [pokemon]
      var generation: BasicData
      var idDragon: Int
      var moves: BasicData
      var nameD: String?
}

  struct GameIndex{
      var gameIndex: Int
      var generation: BasicData
}
  struct damage_details{
      var double_damage_from: [BasicData]
      var double_damage_to: [BasicData]
      var half_damage_from: [BasicData]
      var half_damage_to: [BasicData]
      var no_damage_to: [BasicData]
}
  struct pokemon{
      var pokemonD: BasicData
}
  struct BasicData {
      var name: String
      var url: String
}
