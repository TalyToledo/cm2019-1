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
    
    /*enum CodingKeys: String, CodingKey {
        case titulo = "title"
        case tiempoEnMinutos = "readyInMinutes"
        case tipoCocina = "cuisine"
        case dificultad = "dificulty"
        case ingredientes = "ingredients"
        case pasos = "steps"
        
    }*/
    
    static func create(dict: NSDictionary) -> Receta? {
        guard let titulo = dict["title"] as? String, let tiempoEnMinutos = dict["readyInMinutes"] as? String, let tipoCocina = dict["cuisine"] as? String, let dificultad = dict["dificulty"] as? String, let ingredientes = dict["ingredients"] as? [Ingrediente], let pasos = dict["steps"] as? [String]
            else{return nil}
        return Receta(titulo: titulo, tiempoEnMinutos: tiempoEnMinutos, tipoCocina: tipoCocina, dificultad: dificultad, ingredientes: ingredientes, pasos: pasos)
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




