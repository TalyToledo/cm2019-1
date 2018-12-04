import UIKit

//https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/convert

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
    var targeAmount: Float
    var targetUnit: String
}


var ingredientName: String = "flour"
var sourceAmount: String = "2.5"
var sourceUnit: String = "cups"
var targetUnit: String = "grams"
let baseUrl = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/convert")!

let queryBase: [String:String] = ["ingredientName":ingredientName,"sourceAmount":sourceAmount,"sourceUnit":sourceUnit, "targetUnit": targetUnit]
let headers: [String:String] = ["X-Mashape-Key": "jlnNPIAlbgmshgFdSoh7aYliKsmWp1jvW8sjsnExxlHY77Rd4x", "Accept": "application/json"]

let urlFinal = baseUrl.withQueries(queryBase)!

var request = URLRequest(url: urlFinal)
request.httpMethod = "GET"

for (key, value) in headers {
    request.setValue(value, forHTTPHeaderField: key)
}

let task = URLSession.shared.dataTask(with: request){data,response,error -> Void in
    if let data = data, let datos = String(bytes: data, encoding: .utf8){
        print(datos)
    }
    
}
task.resume()

print(urlFinal)
