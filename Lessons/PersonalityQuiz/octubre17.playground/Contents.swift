//: Playground - noun: a place where people can play

import UIKit

//Protocols; delegates. Clousures

func sum (numbers:[Int]) -> Int {
    var total = 0
    //Còdifo necesario para sumar los numeros del arreglo
    for number in numbers{
        total += number
    }
    return total
    
}

let sumClosure = {(numbers:[Int])-> Int in
    var total = 0
    //Còdifo necesario para sumar los numeros del arreglo
    for number in numbers{
        total += number
    }
    return total
}

let arregloNumeros = [1,2,3,4,5]

print(sum(numbers: arregloNumeros))
let suma = sumClosure(arregloNumeros)



//

struct Track {
    var trackNumber: Int
}

let tracks = [Track(trackNumber: 3), Track(trackNumber: 2), Track(trackNumber: 1), Track(trackNumber: 4)]

//let sortedTracks = tracks.sorted { (track1, track2) -> Bool in
//    return track1.trackNumber < track2.trackNumber
//}

let sortedTracks = tracks.sorted { $0.trackNumber < $1.trackNumber}


///
let names = ["Marduk", "Aketzally", "Rodrigo", "David"]
var fullNames : [String] = []
for name in names {
    let fullName = name + "Pérez"
    fullNames.append(fullName)
    }
//let fullNames2 = names.map{ (cadena) in
//    return cadena + "Perez"
//}
let fullNames2 = names.map{ $0 + "Perez"}

////
let numbers = [4,8,15,16,32,54,2,5,8]
/*let filtro = numbers.filter { (numero) -> Bool in
    return numero < 20
}
print(filtro)*/
let filtro = numbers.filter { $0 < 20 }
print(filtro)

let reductor = numbers.reduce(0) { (actual, siguienteValor) -> Int in
    return actual + siguienteValor
}
print (reductor)


