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
    @IBOutlet weak var preparacionLabel: UILabel!
    
    var selectedRecipe: Receta?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cargaDatos(receta: selectedRecipe!)
        // Do any additional setup after loading the view.
    }
    
    func cargaDatos(receta: Receta){
        var steps: String = ""
        var ingredientes: String = ""
        tituloReceta.text = receta.titulo
        tiempoLabel.text = receta.tiempoEnMinutos + " minutos"
        recetaImage.image = UIImage(named: "imagenReceta.png")
        for item in receta.pasos {
            steps += item + "\n \n"
        }
        for item in receta.ingredientes{
            ingredientes += "- "
            ingredientes += item.nombre + ":" + "\t\t" + item.cantidad + "\t" + item.unidades + "\n"
            
        }
        ingredientesLabel.text = ingredientes
        preparacionLabel.text = steps
        
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
