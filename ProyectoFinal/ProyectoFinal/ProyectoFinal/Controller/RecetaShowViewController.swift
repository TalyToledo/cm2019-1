//
//  RecetaShowViewController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 12/3/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit



class RecetaShowViewController: UIViewController {

    

    @IBOutlet weak var recetaImage: UIImageView!
    @IBOutlet weak var ingredientesLabel: UILabel!
    @IBOutlet weak var tiempoLabel: UILabel!
    @IBOutlet weak var tituloReceta: UILabel!
    
    var selectedRecipe: Receta?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recetaImage.image = UIImage(named: "imagenReceta.png")
        //ingredientesLabel.text = 
        tituloReceta.text = selectedRecipe?.titulo
        tiempoLabel.text = selectedRecipe?.tiempoEnMinutos
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
