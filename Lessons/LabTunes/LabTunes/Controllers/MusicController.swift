//
//  MusicController.swift
//  LabTunes
//
//  Created by Usuario invitado on 11/21/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//

import Foundation
class MusicController {
    static var urlSession = URLSession(configuration: .default)
    
    static func fetchMusic(search: String, completion: @escaping ([Song]?)->Void ){
        //Funcion que trae la música
        guard let url = URL(string: "https://itunes.apple.com/search/media=music&identity=song&term="+search) else {return}//checa la formación de una url
        
        //Configuración del data Task
        let dataTask = urlSession.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint("Error in dataTask: \(error.localizedDescription)")
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
                debugPrint("Error in httpResponse, code out of range between 200 ... 299")
                completion(nil)
                return
            }
            
            guard let data = data else{
                debugPrint("No Data")
                completion(nil)
                return
            }
            guard let songList = try? JSONDecoder().decode(Songs.self, from: data) else {
                debugPrint("Can't decode the data")
                completion(nil)
                return
            }
            //debugPrint(songList)
            completion(songList.results)
        }
        dataTask.resume()
    }
}
