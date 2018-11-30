//
//  TipsViewController.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 11/30/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit


class TipsViewController: UIViewController {
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var tipImage: UIImageView!
    
    @IBOutlet weak var tipDescripcionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipLabel.text = tips[myIndex]
        tipDescripcionLabel.text = tipDescripcion[myIndex]
        tipImage.image = UIImage(named: "tip.png")

        // Do any additional setup after loading the view.
    }
    
}
