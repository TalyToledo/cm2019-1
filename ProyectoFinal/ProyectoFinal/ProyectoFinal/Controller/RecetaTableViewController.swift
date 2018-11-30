//
//  RecetaTableViewController.swift
//  ProyectoFinal
//
//  Created by Igor Dito on 11/27/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class RecetaTableViewController: UITableViewController {
    
    var selectedCategory = 0
    var datosReceta: [Receta] = []
    var nameOfFile: String = "recipes.json"
    
    @IBOutlet weak var categoriaNavigationItem: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datosReceta = RecipeController.loadJson(fileName: nameOfFile)
        debugPrint(datosReceta)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if selectedCategory == 2{
            return 3
        } else if selectedCategory == 3 {
            return 5
        }
        else {return 0}
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
        if segue.identifier == "showAll"{
            selectedCategory = 1
            categoriaNavigationItem.title = "Todas las Recetas"
        } else if segue.identifier == "showByDificulty"{
            selectedCategory = 2
            categoriaNavigationItem.title = "Por Dificultad"
        } else if segue.identifier == "showByTime"{
            selectedCategory = 3
            categoriaNavigationItem.title = "Por tiempo"
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recetaCell", for: indexPath) as! RecetaTableViewCell

        // Configure the cell...
        let currentPlatillo = datosReceta[indexPath.row]
        
        cell.setCell(platillo: currentPlatillo)
        

        return cell
    }
    
    
    
    

}
