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


/*
 练习： 创建NamedShape的另一个子类Circle，构造器接收两个参数，一个是半径一个是名称，在子类Circle中实现area()和simpleDescription()方法。
 */

class Circle:ParentShape{
    var r:Double = 5.0
    
    init(name: String,radius:Double) {
        //super.name = name
        self.r = radius
        super.init(name: name)
    }
    
    func area() -> Double{
        return M_PI * self.r * self.r
    }
    
    override func simpleDescription() -> String {
        return "这个是一个圆圈类"
    }
    
}

/*除了储存简单的属性之外，属性可以有 getter 和 setter 。*/

//等边三角形类

class EquilateralTriangle:ParentShape{
    
    var sideLength:Double = 0.0
    
    init(sideLength:Double, name:String){
        
        self.sideLength = sideLength
        super.init(name: name)
        
        numberOfSides = 3
        
    }
    //周长
    var perimeter:Double{
        get{
            return 3.0*sideLength
        }
        set{
            sideLength = newValue/3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "等边三角形 边长为:\(self.sideLength)"
    }
    
    
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "myTriangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

triangle.name


/*

 在perimeter的 setter 中，新值的名字是newValue。你可以在set之后显式的设置一个名字。
 
 注意EquilateralTriangle类的构造器执行了三步：
 
 设置子类声明的属性值
 调用父类的构造器
 改变父类定义的属性值。其他的工作比如调用方法、getters和setters也可以在这个阶段完成。
 如果你不需要计算属性，但是仍然需要在设置一个新值之前或者之后运行代码，使用willSet和didSet。
 
 比如，下面的类确保三角形的边长总是和正方形的边长相同。
 
*/

class TriangleAndSquare{
    
    var triangle:EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength
        }
    }
    
    
    var square:Square{
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size:Double, name:String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
    
}


var triangleAndSquare = TriangleAndSquare(size: 10, name: "myTestShape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength
/*
处理变量的可选值时，你可以在操作（比如方法、属性和子脚本）之前加?。如果?之前的值是nil，?后面的东西都会被忽略，并且整个表达式返回nil。否则，?之后的东西都会被运行。在这两种情况下，整个表达式的值也是一个可选值。
*/

let optionalSquare:Square? = Square(sideLength: 2.5, name: "optionalSquare")
let sideLength = optionalSquare?.sideLength











