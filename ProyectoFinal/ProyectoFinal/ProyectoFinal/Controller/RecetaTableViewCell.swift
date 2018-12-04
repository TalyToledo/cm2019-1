//
//  RecetaTableViewCell.swift
//  ProyectoFinal
//
//  Created by Igor Dito on 11/28/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class RecetaTableViewCell: UITableViewCell {

    @IBOutlet weak var platilloImagen: UIImageView!
    @IBOutlet weak var titlePlatilloLabel: UILabel!
    @IBOutlet weak var timePlatilloLabel: UILabel!
    

    func setCell(platillo: Receta){
        //platilloImagen.image = UIImage.init(contentsOfFile: "imagenReceta.png")
        platilloImagen.image = UIImage(named: "imagenReceta.png")
        titlePlatilloLabel.text = platillo.titulo
        timePlatilloLabel.text = platillo.tiempoEnMinutos
    }

}
