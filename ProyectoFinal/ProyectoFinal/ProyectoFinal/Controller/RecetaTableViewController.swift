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
    var datosReceta: [Receta]?
    
    @IBOutlet weak var platilloImagen: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datosReceta = RecipeController.loadJson(filename: "recipes")
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recetaCell", for: indexPath)

        // Configure the cell...
        let currentPlatillo = datosReceta![indexPath.row]
        

        return cell
    }
    
    
    
    

}
