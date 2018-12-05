//
//  NotesViewController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 12/4/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var noteText: UITextView!
    @IBOutlet weak var noteLabel: UILabel!
    
    var notes: [String] = []
    var index: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteText.isEditable = true
        //noteLabel.text = 

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
