//
//  RecetaTableViewController.swift
//  ProyectoFinal
//
//  Created by Igor Dito on 11/27/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class RecetaTableViewController: UITableViewController{
    
    var selectedCategory = 0
    var datosReceta: [Receta] = []
    
    @IBOutlet weak var categoriaNavigationItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if selectedCategory == 2{
            let recipeMenu = RecipeController.clasifyByDificulty(allRecipes: datosReceta)
            return recipeMenu.sections.count
        } else if selectedCategory == 3 {
            let recipeMenu = RecipeController.clasifyByTime(allRecipes: datosReceta)
            return recipeMenu.sections.count
        }
        else {return 1}
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if selectedCategory == 2{
            let recipeMenu = RecipeController.clasifyByDificulty(allRecipes: datosReceta)
            debugPrint(recipeMenu.recetas)
            return recipeMenu.recetas[section].count
        }
        else if selectedCategory == 3{
            let recipeMenu = RecipeController.clasifyByTime(allRecipes: datosReceta)
            return recipeMenu.recetas[section].count
        } else{
            return datosReceta.count
        }
        //return datosReceta.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recetaCell", for: indexPath) as! RecetaTableViewCell
        let row = indexPath.row
        let section = indexPath.section
        
        if selectedCategory == 2{
            let clasifiedRecipes = RecipeController.clasifyByDificulty(allRecipes: datosReceta)
            let currentRecipe = clasifiedRecipes.recetas[section][row]
            cell.setCell(platillo: currentRecipe)
            return cell
        }
        if selectedCategory == 3{
            let clasifiedRecipes = RecipeController.clasifyByTime(allRecipes: datosReceta)
            let currentRecipe = clasifiedRecipes.recetas[section][row]
            cell.setCell(platillo: currentRecipe)
            return cell
        }
        else {
            let currentRecipe = datosReceta[indexPath.row]
            cell.setCell(platillo: currentRecipe)
            return cell
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueShow"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! RecetaShowViewController
                //vc.selectedRecipe = datosReceta[indexPath.row]
                if selectedCategory == 2 {
                    let recipes = RecipeController.clasifyByDificulty(allRecipes: datosReceta)
                    let currentRecipe = recipes.recetas[indexPath.section][indexPath.row]
                    vc.selectedRecipe = currentRecipe
                }
                if selectedCategory == 3 {
                    let recipes = RecipeController.clasifyByTime(allRecipes: datosReceta)
                    let currentRecipe = recipes.recetas[indexPath.section][indexPath.row]
                    vc.selectedRecipe = currentRecipe
                }
                else {vc.selectedRecipe = datosReceta[indexPath.row]}
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if selectedCategory == 2{
            let recipes = RecipeController.clasifyByDificulty(allRecipes: datosReceta)
            return recipes.sections[section]
        } else if selectedCategory == 3{
            let recipes = RecipeController.clasifyByTime(allRecipes: datosReceta)
            return recipes.sections[section]
        }
        else {return "Todas las recetas"}
    }
    
    
    
}
