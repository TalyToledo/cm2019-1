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
    let recipes = """
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
"Pour in cooked rice, sesame oil, soy sauce and red pepper flakes and dried chives. Stir to heat through and serve warm."]}
""".data(using: .utf8)!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RecipeController.leerDatos(recipes: recipes)
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
        } else if segue.identifier == "showByDificulty"{
            selectedCategory = 2
        } else if segue.identifier == "showByTime"{
            selectedCategory = 3
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }*/
    
    
    
    

}
