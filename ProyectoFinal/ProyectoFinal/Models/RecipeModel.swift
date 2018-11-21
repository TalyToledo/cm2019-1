//
//  RecipeModel.swift
//  ProyectoFinal
//
//  Created by Igor Dito on 21/11/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation

struct Receta {
    var titulo: String
    var ingredientes: [Ingrediente]
    var pasos: [String]
    var tiempoEnMinutos: Int
    var tipoCocina: String
    var dificultad: String
    
}

struct Ingrediente {
    var nombre: String
    var cantidad: Float
    var unidades: String
}
