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
        cargaDatos(receta: selectedRecipe!)
        // Do any additional setup after loading the view.
    }
    
    func cargaDatos(receta: Receta){
        tituloReceta.text = receta.titulo
        tiempoLabel.text = receta.tiempoEnMinutos + " minutos"
        recetaImage.image = UIImage(named: "imagenReceta.png")
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
