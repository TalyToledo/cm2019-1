//
//  RecetaController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/22/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation


class RecipeController {
  
    static func loadJson(fileName: String) -> [Receta] {
        var baseRecetas: [Receta] = []
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Receta.self, from: data)
                baseRecetas.append(jsonData)
                debugPrint(jsonData)
                
            } catch {
                debugPrint("error:\(error)")
                }
            //onSuccess(baseRecetas)
            
        }
        return baseRecetas
    }
}
