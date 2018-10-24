//
//  ViewController.swift
//  DelegadosImagen
//
//  Created by Usuario invitado on 22/10/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ImageDownloaderDelegate {
    
    var imageDownloader: ImageDownloader?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isHidden = true
        loadingLabel.isHidden = true
        
        let imageUrl: String = "https://media.stsci.edu/uploads/image/display_image/4240/STScI-H-p1850a-d1280x720.png"
        
        imageDownloader = ImageDownloader(imageUrl: imageUrl)
        imageDownloader?.delegate = self
        imageDownloader?.downloadImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    func didFinishDownload(_ sender: ImageDownloader) {
        imageView.image = sender.image
        imageView.isHidden = false
        activityIndicator.isHidden = true
        loadingLabel.isHidden = false
        loadingLabel.text = "Un satélite."
    }
    
}

