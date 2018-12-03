//
//  ViewController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/13/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var allRecipes: [Receta] = []
    var clasification: [[Receta]] = [[]]
    override func viewDidLoad() {
        super.viewDidLoad()
        allRecipes = RecipeController.getInfo()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAll" {
            let vc = segue.destination as! RecetaTableViewController
            let category = 1
            vc.selectedCategory = category
            vc.datosReceta = allRecipes
            vc.categoriaNavigationItem.title = "Todas"
        }
        if segue.identifier == "showByDificulty" {
            let vc = segue.destination as! RecetaTableViewController
            let category = 2
            vc.selectedCategory = category
            clasification = RecipeController.clasifyByDificulty(allRecipes: allRecipes)
            vc.clasifRecetas = clasification
            vc.categoriaNavigationItem.title = "Por dificultad"
        }
        
        if segue.identifier == "showByTime" {
            let vc = segue.destination as! RecetaTableViewController
            let category = 3
            vc.selectedCategory = category
            vc.clasifRecetas = RecipeController.clasifyByTime(allRecipes: allRecipes)
            vc.categoriaNavigationItem.title = "Por Tiempo"
        }
    }
    
}

