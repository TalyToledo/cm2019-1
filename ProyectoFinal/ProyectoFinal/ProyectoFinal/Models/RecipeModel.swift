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
    var pasos: [String]
    var tiempoEnMinutos: String
    var tipoCocina: String
    var dificultad: String
    var ingredientes: [Ingrediente]
    
    enum CodingKeys: String, CodingKey {
        case titulo = "title"
        case pasos = "steps"
        case tiempoEnMinutos = "readyInMinutes"
        case tipoCocina = "cuisine"
        case dificultad = "dificulty"
        case ingredientes = "ingredients"
    }
    
}

struct Ingrediente: Codable {
    var nombre: String
    var cantidad: String
    var unidades: String
    
    enum CodingKeys: String, CodingKey{
        case nombre = "name"
        case cantidad = "amount"
        case unidades = "units"
    }
}




