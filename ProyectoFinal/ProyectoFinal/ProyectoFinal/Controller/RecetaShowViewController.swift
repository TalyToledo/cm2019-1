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
    
    var delegate: RecetaControllerDelegate! = nil
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueShow"{
            let info = segue.destination as! RecetaTableViewController
            info.delegate = self as? RecetaControllerDelegate
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        recetaImage.image = UIImage(named: "<#T##String#>" + ".jpg")
        ingredientesLabel.text = info.datosReceta.description
        // Do any additional setup after loading the view.
    }
    

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
