//
//  ImageDownloader.swift
//  DelegadosImagen
//
//  Created by Usuario invitado on 22/10/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    var imageUrl: String
    var image: UIImage?
    var view: ViewController
    
    init(imageUrl: String, view: ViewController) {
        self.imageUrl = imageUrl
        self.view = view
    }
    
    func downloadImage (){
        //Aquí se hace todo para bajar la imagen
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            guard
                let imageURLUnwrapped = URL(string: self.imageUrl),
                let imageData = NSData(contentsOf: imageURLUnwrapped),
                let image = UIImage(data: imageData as Data)
            else{return}
        }
        
    }
    
    func didDownloadImage() {
        // Lo que se hace una vez que se bajo
    }
}
