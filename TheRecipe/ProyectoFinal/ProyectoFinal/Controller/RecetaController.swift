//
//  RecetaController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/22/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation

let jsonFromWeb = """
[
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
"Pour in cooked rice, sesame oil, soy sauce and red pepper flakes and dried chives. Stir to heat through and serve warm."]},


{"title": "Tinga", "readyInMinutes" : "40", "cuisine": "Mexican", "dificulty":"easy", "ingredients":
[{"name":"pechuga de pollo", "amount":"1000", "units": "grams"},
{"name":"jitomate", "amount":"4", "units": ""},
{"name":"chile chipotle", "amount":"3", "units": ""},
{"name":"caldo de pollo", "amount":"0.5", "units": "cup"},
{"name":"laurel", "amount":"1", "units": "hoja"},
{"name":"sal", "amount":"4", "units": "servings"}],
"steps":[ "Coloca las pechugas de pollo en una olla pequeÒa, cubre con agua y agrega sal. Deja que hiervan a fuego alto, reduce el fuego a bajo y cocina hasta que se hayan cocido, aproximadamente 20 a 25 minutos (depende del tamaÒo). Deja enfriar un poco y deshebra.",
"Licua los tomates, el chipotle, sal, pimenta y caldo.",
"Cocina la cebolla en un poco de aceite por unos 3 a 4 minutos o hasta que se suavice.",
"Agrega la mezcla de la licuadora, la hoja de laurel y cocina 3 minutos.",
"Agrega el pollo deshebrado, sazona al gusto con sal y pimienta y mezcla bien.",
"Cocina 5 a 8 minutos m·s.",
"Pasado el tiempo retira la hoja de laurel y sirve como m·s se te antoje."]},

{"title": "Pesto Pasta", "readyInMinutes" : "20", "cuisine": "Italian", "dificulty":"easy", "ingredients":
[{"name":"chopped", "amount":"0.5", "units": "cup"},
{"name":"pesto", "amount":"2.5", "units": "tablespoons"},
{"name":"olive oil", "amount":"2", "units": "tablespoons"},
{"name":"grated parmesan cheese", "amount":"2", "units": "tablespoons"},
{"name":"pasta", "amount":"16", "units": "ounzes"},
{"name":"ground pepper", "amount":"8", "units": "servings"},
{"name":"salt", "amount":"8", "units": "servings"}],
"steps":[ "Cook pasta in a large pot of boiling water until done. Drain.",
"Meanwhile, heat the oil in a frying pan over medium low heat. Add pesto, onion, and salt and pepper. Cook about five minutes, or until onions are soft.",
"In a large bowl, mix pesto mixture into pasta. Stir in grated cheese. Serve."]}


]
""".data(using: .utf8)!


class RecipeController {
    
    static func getInfo () -> [Receta]{
        var allRecipes: [Receta] = []
        let jsonDecoder = JSONDecoder()
        if let results = try? jsonDecoder.decode([Receta].self, from: jsonFromWeb){
            allRecipes = results
        }
        return allRecipes
    }
    
    static func clasifyByDificulty (allRecipes: [Receta]) -> ClasifiedRecipes{
        
        let recetasDificultad = ClasifiedRecipes()
        var easyRecipes: [Receta] = []
        var mediumRecipes: [Receta] = []
        var hardRecipes: [Receta] = []
        
        for receta in allRecipes{
            switch receta.dificultad {
            case "easy":
                easyRecipes.append(receta)
                
            case "medium":
                mediumRecipes.append(receta)
            case "hard":
                hardRecipes.append(receta)
            default:
                break
            }
        }
        recetasDificultad.add(section: "Easy", receta: easyRecipes)
        recetasDificultad.add(section: "Medium", receta: mediumRecipes)
        recetasDificultad.add(section: "Hard", receta: hardRecipes)
        
        return recetasDificultad
    }
    
    static func clasifyByTime (allRecipes: [Receta]) -> ClasifiedRecipes{
        let recetasTiempo = ClasifiedRecipes()
        var fifteenMinutes: [Receta] = []
        var thirtyMinutes: [Receta] = []
        var fortyMinutes: [Receta] = []
        var hourPlus: [Receta] = []
        
        for receta in allRecipes {
            let tiempo = Int(receta.tiempoEnMinutos)
            
            if tiempo! >= 15 && tiempo! < 30{
                fifteenMinutes.append(receta)
            }
            else if tiempo! >= 30 && tiempo! < 40 {
                thirtyMinutes.append(receta)
            }
            else if tiempo! >= 40 && tiempo! < 50 {
                fortyMinutes.append(receta)
            }
            else {
                hourPlus.append(receta)
            }
            
        }
        recetasTiempo.add(section: "15-30", receta: fifteenMinutes)
        recetasTiempo.add(section: "30-40", receta: thirtyMinutes)
        recetasTiempo.add(section: "40-50", receta: fortyMinutes)
        recetasTiempo.add(section: "+60", receta: hourPlus)
        
        return recetasTiempo
    }
    
}

