//
//  TipsTableViewController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/30/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

var tips = ["Tip 1","Tip 2","Tip 3","Tip 4","Tip 5"]
var tipDescripcion = ["Saltea algusto","Echale sal de apoco hasta tener un buen sabor","Cocona feliz nunca enojado","Usa guantes y mandil al cocinar con cosas calientes","Nunca nunca nunca eches agua al aceite caliente"]

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
