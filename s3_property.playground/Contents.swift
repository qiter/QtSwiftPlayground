//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*
 
 存储属性（Stored Properties）
 计算属性（Computed Properties）
 属性观察器（Property Observers）
 全局变量和局部变量（Global and Local Variables）
 类型属性（Type Properties）
 
 */

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

rangeOfThreeItems.firstValue



class DataImporter {
    //DataImporter负责导入文件数据的类
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")

/*
 DataManager 类包含一个名为 data 的存储属性，初始值是一个空的字符串（String）数组。这里没有给出全部代码，只需知道 DataManager 类的目的是管理和提供对这个字符串数组的访问即可。
 
 DataManager 的一个功能是从文件导入数据。该功能由 DataImporter 类提供，DataImporter 完成初始化需要消耗不少时间：因为它的实例在初始化时可能要打开文件，还要读取文件内容到内存。
 
 DataManager 管理数据时也可能不从文件中导入数据。所以当 DataManager 的实例被创建时，没必要创建一个 DataImporter 的实例，更明智的做法是第一次用到 DataImporter 的时候才去创建它。
 
 */

manager.importer.fileName

//注意
//如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。

struct Point {
    var x = 0.0,  y = 0.0
}

struct Size { var width = 0.0, height = 0.0 }

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point{
        get {
            let centerX = origin.x + (size.width/2)
            let centerY = origin.y + (size.height/2)
            return Point(x: centerX, y: centerY)
        }
        /*
        set(newCenter){
            origin.x = newCenter.x - (size.width/2)
            origin.y = newCenter.y - (size.height/2)
        }
        */
        set {
            origin.x = newValue.x - (size.width/2)
            origin.y = newValue.y - (size.height/2)
        }
    }
}

var square = Rect(origin: Point(x:0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center

square.center = Point(x: 15.0, y: 15.0)

square.origin.y


//只读计算属性的声明可以去掉 get 关键字和花括号

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width*height*depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
fourByFiveByTwo.volume


class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print(newValue)
        }
        didSet {
            print("添加数量\(totalSteps-oldValue)")
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps

stepCounter.totalSteps = 360
stepCounter.totalSteps

stepCounter.totalSteps = 896
stepCounter.totalSteps


































