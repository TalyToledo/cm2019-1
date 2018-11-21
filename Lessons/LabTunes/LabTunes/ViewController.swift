//
//  ViewController.swift
//  LabTunes
//
//  Created by Usuario invitado on 11/21/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        MusicController.fetchMusic (search: "thebeatles") { (itemsSongs) in
            DispatchQueue.main.sync {
                debugPrint(itemsSongs ?? "No items")
            }
            
        }
    }


}

