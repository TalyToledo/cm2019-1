//
//  RecetaController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/22/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation


class RecipeController {
    

    static func leerDatos(recipes: Data){

        do{
            let response = try JSONDecoder().decode(Receta.self, from: recipes)
        }
        catch{
            print(error)
        }
        
    }

    
}
