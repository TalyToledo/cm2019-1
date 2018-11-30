//
//  RecetaController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/22/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation


class RecipeController {
  static var urlSession = URLSession(configuration: .default)
    
    static func loadJson(filename fileName: String, onSucces: @escaping ([Receta]) -> Void) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else{return}
        let dataTask = urlSession.dataTask(with: url){
            
        }
        
        /*guard let data = try Data(contentsOf: url, options: .mappedIfSafe), let json = parseData(data: data) else{return}*/
        
        /*if let recetas = createRecipeArray(jsonNSDictionary: json){
            onSucces(recetas)
        }else {
            debugPrint("No se puede crear el arreglo de recetas")
        }*/
    }
    
    static func parseData(data: Data) -> NSDictionary? {
        let json = try? JSONSerialization.jsonObject(with: data, options: [])
        let jsonNSDictionary = json as? NSDictionary
        return jsonNSDictionary
    }
    
    static func createRecipeArray(jsonNSDictionary: NSDictionary) -> [Receta]?{
        guard let results = jsonNSDictionary["recipes"], let resultNSDictionary = results as? [NSDictionary] else {return nil}
        var todasRecetas: [Receta] = []
        for dataResults in resultNSDictionary {
            if let unaReceta = Receta.create(dict: dataResults) {
                todasRecetas.append(unaReceta)
            }
            else{
                debugPrint("No se creo la instancia de todasRecetas, no se puede agregar unaReceta")
            }
        }
        return (todasRecetas.count > 0 ? todasRecetas: nil)
    }
}
