//
//  NotesTableViewController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 12/4/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit



class NotesTableViewController: UITableViewController {
    
    var notes = ["Nota 1","Nota2"]
    var index = 0


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)

        cell.textLabel?.text = notes[indexPath.row]

        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "segueNote", sender: self)
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueNote"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! NotesViewController
                vc.notes = notes
                vc.index = indexPath.row
            }
        }
    }
    
    
    
    

}
