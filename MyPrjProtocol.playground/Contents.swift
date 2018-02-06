//: Playground - noun: a place where people can play

import UIKit

var str = "Protocol"

protocol OneProtocol {
    var name: String {get set }
    var age: String  {get set }
  // func hello
}

protocol TwoProtocol: OneProtocol {
    
}

struct Perents: OneProtocol {
    var name: String
    var age: String
}

struct Kids: OneProtocol {
    var name: String
    var age: String
    
}
struct Cat: OneProtocol {
    var name: String
    var age: String
    
}
var perents1 = Perents(name: "Jack", age: "28")
var perents = Perents(name: "Janny", age: "25")
var kids = Kids(name: "Masha", age: "14")

var array: [OneProtocol] = [perents1,perents,kids]

func sortFamily(array: [OneProtocol]) {

   for value in array {
    print(value.name, value.age)
  }
}

sortFamily(array: array)

