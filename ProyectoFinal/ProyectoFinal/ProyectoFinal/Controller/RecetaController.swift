//
//  RecetaController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/22/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation


class RecipeController {
  //static var urlSession = URLSession(configuration: .default)
    
    static func loadJson(fileName: String, onSucces: @escaping (Recipes) -> Void) {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else{return}
        
        /*let dataTask = urlSession.dataTask(with: url){ data, response, error in
            if let error = error {
                debugPrint("Error in dataTask: \(error.localizedDescription)")
                return
            }
            /*guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else{
                debugPrint("Error in httpResponse, code out of range")
                return
            }*/
            guard let data = data, let json = parseData(data: data) else{return}
            if let allRecipes = createRecipeArray(jsonNSDictionary: json){
                onSucces(allRecipes)
            } else{
                debugPrint("Can't create recipes array")
            }
        }
        dataTask.resume()*/
        guard let data = try? Data(contentsOf: url, options: .mappedIfSafe)/*, let json = parseData(data: data)*/ else{return}
        guard let recipeList = try? JSONDecoder().decode(Recipes.self, from: data) else{
            debugPrint("Can't decode")
            return
        }
        onSucces(recipeList)

        
        
    }
    
    /*static func parseData(data: Data) -> NSDictionary? {
        let json = try? JSONSerialization.jsonObject(with: data, options: []), jsonNSDictionary = json as? NSDictionary
        return jsonNSDictionary
    }*/
    
    /*static func createRecipeArray(jsonNSDictionary: NSDictionary) -> [Receta]?{
        guard let results = jsonNSDictionary["recipes"], let resultNSDictionary = results as? [NSDictionary] else {return nil}
        var todasRecetas: [Receta] = []
        for dataResults in resultNSDictionary {
            if let unaReceta  {
                todasRecetas.append(unaReceta)
            }
            else{
                debugPrint("No se creo la instancia de todasRecetas, no se puede agregar unaReceta")
            }
        }
        return (todasRecetas.count > 0 ? todasRecetas: nil)
    }*/
}
