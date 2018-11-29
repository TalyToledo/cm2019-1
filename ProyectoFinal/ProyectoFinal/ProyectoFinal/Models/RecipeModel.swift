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
    
    /*init(from decoder: Decoder) throws {
     let values = try decoder.container(keyedBy: CodingKeys.self)
     titulo = try values.decode(String.self, forKey: CodingKeys.titulo)
     ingredientes = try values.decode([Ingrediente].self, forKey: CodingKeys.ingredientes)
     pasos = try values.decode([String].self, forKey: CodingKeys.pasos)
     tiempoEnMinutos = try values.decode(Int.self, forKey: CodingKeys.tiempoEnMinutos)
     tipoCocina = try values.decode(String.self, forKey: CodingKeys.tipoCocina)
     dificultad = try values.decode(String.self, forKey: CodingKeys.dificultad)
     }*/
    
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
    
    /*init (from decoder: Decoder) throws {
     let values = try decoder.container(keyedBy: CodingKeys.self)
     nombre = try values.decode(String.self, forKey: CodingKeys.nombre)
     cantidad = try values.decode(Float.self, forKey: CodingKeys.cantidad)
     unidades = try values.decode(String.self, forKey: CodingKeys.unidades)
     }*/
}




