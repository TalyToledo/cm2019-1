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
    var tiempoEnMinutos: String
    var tipoCocina: String
    var dificultad: String
    var ingredientes: [Ingrediente]
    var pasos: [String]
    
    enum CodingKeys: String, CodingKey {
        case titulo = "title"
        case tiempoEnMinutos = "readyInMinutes"
        case tipoCocina = "cuisine"
        case dificultad = "dificulty"
        case ingredientes = "ingredients"
        case pasos = "steps"
        
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

class ClasifiedRecipes {
    var sections: [String] = []
    var recetas: [[Receta]] = []
    
    func add(section: String, receta: [Receta]){
        sections = sections + [section]
        recetas = recetas + [receta]
    }
}

/*class AllClasifiedItems {
    
}*/
