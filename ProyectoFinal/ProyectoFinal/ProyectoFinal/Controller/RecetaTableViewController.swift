//
//  RecetaTableViewController.swift
//  ProyectoFinal
//
//  Created by Igor Dito on 11/27/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class RecetaTableViewController: UITableViewController{
    
    //var delegate: RecetaControllerDelegate! = nil
    var selectedCategory = 0
    var datosReceta: [Receta] = []
    var clasifRecetas: [[Receta]] = [[]]
    var seleccion: Receta?
    
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
        /*if selectedCategory == 2{
            return 3
        } else if selectedCategory == 3 {
            return 5
        }
        else {return 1}*/
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        /*if selectedCategory == 1{
            return datosReceta.count}
        if selectedCategory == 2{
            return clasifRecetas[section].count
        }*/
        return datosReceta.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueShow"{
            let vc = segue.destination as! RecetaShowViewController
            vc.selectedRecipe = seleccion
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recetaCell", for: indexPath) as! RecetaTableViewCell

        // Configure the cell...
        let currentPlatillo = datosReceta[indexPath.row]
        
        cell.setCell(platillo: currentPlatillo)
        
        /*switch selectedCategory {
        case 2,3:
            for array in clasifRecetas{
                let current = array[indexPath.section]
                cell.setCell(platillo: current)
            }
        default:
            let currentPlatillo = datosReceta[indexPath.row]
            cell.setCell(platillo: currentPlatillo)
        }*/
        

        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.seleccion = datosReceta[indexPath.row]
    }
 

}
