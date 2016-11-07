//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

shapeDescription



/*
这个版本的Shape类缺少了一些重要的东西：一个构造函数来初始化类实例。使用init来创建一个构造器。
*/

class ParentShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

/*
 
 注意self被用来区别实例变量。当你创建实例的时候，像传入函数参数一样给类传入构造器的参数。每个属性都需要赋值——无论是通过声明（就像numberOfSides）还是通过构造器（就像name）。
 
 如果你需要在删除对象之前进行一些清理工作，使用deinit创建一个析构函数。
 
 子类的定义方法是在它们的类名后面加上父类的名字，用冒号分割。创建类的时候并不需要一个标准的根类，所以你可以忽略父类。
 
 子类如果要重写父类的方法的话，需要用override标记——如果没有添加override就重写父类方法的话编译器会报错。编译器同样会检测override标记的方法是否确实在父类中。
 
*/

class Square: ParentShape{
    var sideLength:Double = 0.0
    init(sideLength:Double,name:String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    
    func area() -> Double{
        return sideLength*sideLength
    }
    
    override func simpleDescription() -> String {
        return "一个正方形边长为：\(sideLength)"
    }
    
    
}

let test = Square(sideLength: 5.2, name: "Qt的正方形")
test.area()
test.simpleDescription()


























