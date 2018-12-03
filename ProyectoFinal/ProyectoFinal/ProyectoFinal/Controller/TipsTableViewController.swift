//
//  TipsTableViewController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/30/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

var tips = ["Tip 1","Tip 2","Tip 3","Tip 4","Tip 5"]
var tipDescripcion = [
    "Para comprobar si el huevo que tenía almacenado aún es fresco, agrega a un vaso con agua una cucharadita de sal, disuélvela bien y coloca el huevo, si se va al fondo significa que está fresco, pero si flota quiere decir que ya no se puede consumir.",
    "Reutiliza los envases y recipientes de yogurt y mantequilla para guardar y congelar sobrantes de comida o úsalos como moldes para gelatinas.",
    "Usa guantes y mandil al cocinar con cosas calientes, ten cuidado al usar cuchillos para rebanar fruta o carne, tambien toma precauciones al abrir alimentos enlatados",
    "Los alimentos congelados deben deshielarse en el refrigerador, el microondas o colocar el paquete envuelto en agua fría. No lo dejes sobre superficies a temperatura ambiente, porque las bacterias se reproducen rápidamente.",
    "Cubre las ensaladas y verduras frescas con agua fría hasta el momento en que las sirvas. Se conservarán frescas y crujientes"]

var myIndex = 0

class TipsTableViewController: UITableViewController {

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tips.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tipCell = tableView.dequeueReusableCell(withIdentifier: "tipCell", for: indexPath)

        tipCell.textLabel?.text = tips[indexPath.row]

        return tipCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
}
