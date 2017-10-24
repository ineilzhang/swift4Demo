//
//  Initialization.swift
//  Swift4Demo
//
//  Created by Neil Zhang on 2017/10/19.
//  Copyright © 2017年 Neil Zhang. All rights reserved.
//

import Foundation

//MARK: - Setting Initial Values for Stored Properties

//Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties cannot be left in an indeterminate state.

struct Fahrenheit {
    var temprature: Double
    //Initializers
    init() {
        temprature = 20.0
    }
    
    //Default Property Values
    var degree = 0.0
}

func fahrenheitDemo() {
    let f = Fahrenheit()
    print(f.temprature)
}


//MARK: - Customizing Initialization

struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin:Double) {
        temperatureInCelsius = kelvin - 237.15
    }
}

func celsiusDemo() {
    var celsius = Celsius(fromFahrenheit: 100)
    print(celsius.temperatureInCelsius)
    celsius = Celsius(fromKelvin: 300)
    print(celsius.temperatureInCelsius)
}

//MARK: - Parameter Names and Argument Labels

struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}

func colorDemo() {
    var color = Color(red: 1.0, green: 1.0, blue: 1.0)
    print(color.red+color.green+color.blue)
    color = Color(white: 0.5)
    print(color.red)
}

//MARK: - Initializer Parameters Without Argument Labels

struct CelsiusNew {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
//let bodyTemperature = Celsius(37.0)

//MARK: - Optional Property Types

class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

func surveyDemo() {
    var question = SurveyQuestion(text: "Chinese perple?")
    question.ask()
    question.response = "Yes"
    print(question.response)
}

//MARK: - Assigning Constant Properties During Initialization


class SurveyQuestionNew {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}

func constantPropInitDemo() {
    let beetsQuestion = SurveyQuestion(text: "How about beets?")
    beetsQuestion.ask()
    // Prints "How about beets?"
    beetsQuestion.response = "I also like beets. (But not with cheese.)"
}

//MARK: - Default Initializers

class ShoppingListItem {
    var name: String? //default nil
    var quantity = 1
    var perchased = false
}

func defaultInitializerDemo(){
    let listItem = ShoppingListItem()
    print("\(listItem.name)  \(listItem.quantity)  \(listItem.perchased)")
}

//MARK: - Memberwise Initializers for Structure Types

struct Size {
    var width = 0.0
    var height: Double
}
let twoByTwo = Size(width: 2.0, height: 2.0)

//MARK: - Initializer Delegation for Value Types

struct SizeNew {
    var width = 0.0, height = 0.0
}

struct PointNew {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = PointNew()
    var size = SizeNew()
    init() {}
    init(origin: PointNew, size: SizeNew) {
        self.origin = origin
        self.size = size
    }
    init(center: PointNew, size: SizeNew) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: PointNew(x: originX, y: originY), size: size)
    }
}

func memberwiseInitializerDemo() {
    let basicRect = Rect()
    print(basicRect.origin)
    
    let originRect = Rect(origin: PointNew(x: 1.0, y: 1.0), size: SizeNew(width: 2.0, height: 2.0))
    print(originRect.origin)
    
    let centerRect = Rect(center: PointNew(x: 1.0, y: 1.0), size: SizeNew(width: 3.0, height: 3.0))
    print(centerRect.origin)
}

//MARK: - Class Inheritance and Initialization

//All of a class’s stored properties—including any properties the class inherits from its superclass—must be assigned an initial value during initialization.

//Every class must have at least one designated initializer.

//Designated initializers
//init(parameters) {
//    statements
//}

//Convenience initializers
//convenience init(parameters) {
//    statements
//}


//MARK: - Initializer Delegation for Class Types
//Rule 1
//A designated initializer must call a designated initializer from its immediate superclass.
//
//Rule 2
//A convenience initializer must call another initializer from the same class.
//
//Rule 3
//A convenience initializer must ultimately call a designated initializer.


//super.init 必须在本类的所有属性赋值之后才能调用，因为在 init 方法中可能会访问到本类中未初始化的属性
class Person {
    var name : String
    init(name : String){
        self.name = name
        printDescription()
    }
    
    func printDescription() -> () {
        print("name=\(name)")
    }
}
class Engineer: Person {
    var title : String
    init(name: String, title: String) {
        self.title = title
        super.init(name: name)
    }
    
    override func printDescription() -> () {
        print("name=\(name), title=\(title)")
    }
}

func superInitDemo() {
    var engineer = Engineer(name: "engineer1", title: "title1")
}

//MARK: - Initializer Inheritance and Overriding

//Unlike subclasses in Objective-C, Swift subclasses do not inherit their superclass initializers by default.

//When you write a subclass initializer that matches a superclass designated initializer, you are effectively providing an override of that designated initializer.

//You always write the override modifier when overriding a superclass designated initializer, even if your subclass’s implementation of the initializer is a convenience initializer.

//Subclasses can modify inherited variable properties during initialization, but can not modify inherited constant properties.

class Vehicle1 {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

class Bicycle1: Vehicle1 {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

func initializerInheritanceAndOverriding() {
    let biycle1 = Bicycle1()
    print(biycle1.numberOfWheels)
}


//MARK: - Automatic Initializer Inheritance

/*
 Rule 1
 If your subclass doesn’t define any designated initializers, it automatically inherits all of its superclass designated initializers.
 
 Rule 2
 If your subclass provides an implementation of all of its superclass designated initializers—either by inheriting them as per rule 1, or by providing a custom implementation as part of its definition—then it automatically inherits all of the superclass convenience initializers.
 */



//MARK: - Designated and Convenience Initializers in Action

class Food {
    var name: String
    init(name: String) {
        print("food init")
        self.name = name
    }
    convenience init() {
        print("food converience init")
        self.init(name: "[Unnamed]")
    }
}

//let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"

//let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        print("recipe init")
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        print("recipe override converience init")
        self.init(name: name, quantity: 1)
    }
}

func designatedAndConvenienceInitializerDemo() {
    let recipe = RecipeIngredient()
    print(recipe.name)
    let recipe1 = RecipeIngredient(name: "bacon", quantity: 1)
    print(recipe1.name)
}



