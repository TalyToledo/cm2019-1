//
//  RecetaController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/22/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation


class RecipeController {
  
    static func loadJson(filename fileName: String) -> [Receta]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Receta.self, from: data)
                var baseRecetas: [Receta] = []
                baseRecetas.append(jsonData)
                debugPrint(jsonData)
                return baseRecetas
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
    
    /*static func leerDatos(recipes: Data){

        do{
            let response = try JSONDecoder().decode(Receta.self, from: recipes)
        }
        catch{
            print(error)
        }
        
    }*/

    
}
