//
//  ConversionAmounts.swift
//  ProyectoFinal
//
//  Created by Usuario invitado on 12/4/18.
//  Copyright © 2018 Usuario invitado. All rights reserved.
//
import Foundation
import UIKit

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map{
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}

struct ConvertedAmount: Codable {
    var sourceAmount: Float
    var sourceUnit: String
    var targetAmount: Float
    var targetUnit: String
    
    enum CodingKeys: String, CodingKey {
        case sourceAmount
        case sourceUnit
        case targetAmount
        case targetUnit
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sourceAmount = try values.decode(Float.self, forKey: CodingKeys.sourceAmount)
        sourceUnit = try values.decode(String.self, forKey: CodingKeys.sourceUnit)
        targetAmount = try values.decode(Float.self, forKey: CodingKeys.targetAmount)
        targetUnit = try values.decode(String.self, forKey: CodingKeys.targetUnit)
        
    }
}

class ConvertAmounts {
    
    static var urlSession = URLSession(configuration: .default)
    
    static func getAmounts(ingredientName: String, sourceAmount: String, sourceUnit: String, targetUnit: String, onSuccess: @escaping (ConvertedAmount)->Void){
        
        let baseUrl = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/convert")!
        let queryBase: [String:String] = ["ingredientName":ingredientName,"sourceAmount":sourceAmount,"sourceUnit":sourceUnit, "targetUnit": targetUnit]
        let headers: [String:String] = ["X-Mashape-Key": "jlnNPIAlbgmshgFdSoh7aYliKsmWp1jvW8sjsnExxlHY77Rd4x", "Accept": "application/json"]
        
        let urlFinal = baseUrl.withQueries(queryBase)!
        
        var request = URLRequest(url: urlFinal)
        request.httpMethod = "GET"
        
        for (key, value) in headers {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            if let error = error {
                debugPrint("Error in dataTask: \(error.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, (200 ... 299).contains(httpResponse.statusCode) else {
                debugPrint("Error, out of range")
                return
            }
            guard let data = data else{return}
            
            guard let conversion = try? JSONDecoder().decode(ConvertedAmount.self, from: data) else {
                debugPrint("Can't decode data")
                return
            }
            onSuccess(conversion)
        }
        task.resume()
        
    }
    
    static func decodeData (data: Data) -> ConvertedAmount?{
        let jsonDecoder = JSONDecoder()
        let resultados = try? jsonDecoder.decode(ConvertedAmount.self, from: data)
        
        return resultados
    }
    
}
