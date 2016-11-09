//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//枚举和结构体

//使用enum来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法


enum SomeEnumeration {
    // 枚举定义放在这里
}


enum CompassPoint{
    case North
    case South
    case East
    case West
}

enum Planet{
    case Mercury,Venus,Earth,Mars,Jupiter,Saturn,Uranus,Neptune
}

var directionToHead = CompassPoint.South
directionToHead = .East
switch directionToHead {
    case .North:
        print("大多数行星在北方")
    case .South:
        print("小心企鹅")
    case .East:
        print("east")
    case .West:
        print("west")
}


let somePlanet = Planet.Earth

switch somePlanet {
case .Earth:
    print("大多数是没有害的")
default:
    print("不适合人类生存")
}



//在 Swift 中，使用如下方式定义表示两种商品条形码的枚举：
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

/*
 以上代码可以这么理解：
 
 “定义一个名为Barcode的枚举类型，它的一个成员值是具有(Int，Int，Int，Int)类型关联值的UPCA，另一个成员值是具有String类型关联值的QRCode。”
 
 这个定义不提供任何Int或String类型的关联值，它只是定义了，当Barcode常量和变量等于Barcode.UPCA或Barcode.QRCode时，可以存储的关联值的类型。
 
 然后可以使用任意一种条形码类型创建新的条形码，例如：
*/

var productBarCode = Barcode.UPCA(8, 32823, 2323, 3)

//上面的例子创建了一个名为productBarcode的变量，并将Barcode.UPCA赋值给它，关联的元组值为(8, 85909, 51226, 3)。

productBarCode = .QRCode("jkaksjdfkajsdkjf")



enum Planet2: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}


Planet2.Mercury.rawValue

Planet2.Venus.rawValue


enum CompassPoint2: String {
    case North, South, East, West
}

CompassPoint2.North

CompassPoint2.North.rawValue






















