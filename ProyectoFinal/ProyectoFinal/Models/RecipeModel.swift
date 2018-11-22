//
//  RecipeModel.swift
//  ProyectoFinal
//
//  Created by Igor Dito on 21/11/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation

struct Receta: Codable {
    var titulo: String
    //var ingredientes: [Ingrediente]
    var pasos: [String]
    var tiempoEnMinutos: Int
    var tipoCocina: String
    //var dificultad: String
    
    enum CodingKeys: String, CodingKey {
        case titulo = "title"
        //case ingredientes = "extendedIngridientes"
        case pasos = "steps"
        case tiempoEnMinutos = "readyInMinutes"
        case tipoCocina = "cuisines"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        titulo = try values.decode(String.self, forKey: CodingKeys.titulo)
        //ingredientes = try values.decode(String.self, forKey: CodingKeys.ingredientes)
        pasos = try values.decode([String].self, forKey: CodingKeys.pasos)
        tiempoEnMinutos = try values.decode(Int.self, forKey: CodingKeys.tiempoEnMinutos)
        tipoCocina = try values.decode(String.self, forKey: CodingKeys.tipoCocina)
        
    }
    
}

struct Ingrediente: Codable {
    var nombre: String
    var cantidad: Float
    var unidades: String
}
