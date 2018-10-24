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
    var delegate: ImageDownloaderDelegate?
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
    }
    
    func downloadImage (){
        //Aquí se hace todo para bajar la imagen
        DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async {
            guard
                let imageURLUnwrapped = URL(string: self.imageUrl),
                let imageData = NSData(contentsOf: imageURLUnwrapped),
                let image = UIImage(data: imageData as Data)
            else{return}
            self.image = image
            print("Image has been downloaded and set on instance")
            DispatchQueue.main.async {
                self.didDownloadImage()
            }
        }
        
    }
    
    func didDownloadImage() {
        // Lo que se hace una vez que se bajo
        print("How are changes made in the properties of the ViewController")
        delegate?.didFinishDownload(self)

    }
}
