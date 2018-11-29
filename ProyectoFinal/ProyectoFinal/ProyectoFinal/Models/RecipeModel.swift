//
//  RecipeModel.swift
//  ProyectoFinal
//
//  Created by Igor Dito on 21/11/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation

let recipes = """
{"recipes": [
{"title": "The Best Fried Rice", "readyInMinutes" : "30", "cuisine": "Asian", "dificulty":"easy", "ingredients":
[{"name":"chicken broth", "amount":"2", "units": "cups"},
{"name":"dried chives", "amount":"1", "units": "tablespoons"},
{"name":"eggs", "amount":"2", "units": ""},
{"name":"frozen corn", "amount":"0.6666", "units": "cup"},
{"name":"garlic", "amount":"1", "units": "clove"},
{"name":"olive oil", "amount":"2", "units": "tablespoons"},
{"name":"peas", "amount":"0.6666", "units": "cup"},
{"name":"red onion", "amount":"0.5", "units": ""},
{"name":"red pepper flakes", "amount":"1", "units": "pinch"},
{"name":"salt", "amount":"4", "units": "servings"},
{"name":"sesame oil", "amount":"1.5", "units": "tablespoons"},
{"name":"soy sauce", "amount":"0.25", "units": "cup"},
{"name":"white rice", "amount":"1", "units": "cup"}],
"steps":[ "In medium saucepan, measure and pour rice, chicken broth and salt. Cover and bring to boil, then reduce to simmer. Cook until rice is tender, 15-18 minutes.",
"Remove from heat.In large skillet, heat oil over medium high heat.",
"Saute onion, garlic, peas and corn for about 5 minutes or until onions start to become tender. Push veggies over to one side, crack eggs into pan and scramble.",
"Pour in cooked rice, sesame oil, soy sauce and red pepper flakes and dried chives. Stir to heat through and serve warm."]}
]}
""".data(using: .utf8)

struct Receta: Codable {
    var titulo: String
    var pasos: [String]
    var tiempoEnMinutos: Int
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
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        titulo = try values.decode(String.self, forKey: CodingKeys.titulo)
        ingredientes = try values.decode([Ingrediente].self, forKey: CodingKeys.ingredientes)
        pasos = try values.decode([String].self, forKey: CodingKeys.pasos)
        tiempoEnMinutos = try values.decode(Int.self, forKey: CodingKeys.tiempoEnMinutos)
        tipoCocina = try values.decode(String.self, forKey: CodingKeys.tipoCocina)
        dificultad = try values.decode(String.self, forKey: CodingKeys.dificultad)
        //self.ingredientes = ingredientes
    }
    
}

struct Ingrediente: Codable {
    var nombre: String
    var cantidad: Float
    var unidades: String
    
    /*enum CodingKeys: String, CodingKey{
        case nombre = "name"
        case cantidad = "amount"
        case unidades = "units"
    }*/
    
    /*init (from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        nombre = try values.decode(String.self, forKey: CodingKeys.nombre)
        cantidad = try values.decode(Float.self, forKey: CodingKeys.cantidad)
        unidades = try values.decode(String.self, forKey: CodingKeys.unidades)
    }*/
}

//var recipesFromWeb: [Receta]
//let jsonDecoder = JSONDecoder()
