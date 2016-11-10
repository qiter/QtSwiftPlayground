//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*
 类和结构体对比
 
 Swift 中类和结构体有很多共同点。共同处在于：
 
 定义属性用于存储值
 定义方法用于提供功能
 定义下标操作使得可以通过下标语法来访问实例所包含的值
 定义构造器用于生成初始化值
 通过扩展以增加默认实现的功能
 实现协议以提供某种标准功能
 
 更多信息请参见属性，方法，下标，构造过程，扩展，和协议。
 
 与结构体相比，类还有如下的附加功能：
 
 继承允许一个类继承另一个类的特征
 类型转换允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 更多信息请参见继承，类型转换，析构过程，和自动引用计数。
 
 
 */

class SomeClass {
    // class definition goes here
}


struct SomeStructure {
    // structure definition goes here
}


struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name:String?
    
}


/*
 在上面的示例中我们定义了一个名为Resolution的结构体，用来描述一个显示器的像素分辨率。这个结构体包含了两个名为width和height的存储属性。存储属性是被捆绑和存储在类或结构体中的常量或变量。当这两个属性被初始化为整数0的时候，它们会被推断为Int类型。
 
 在上面的示例中我们还定义了一个名为VideoMode的类，用来描述一个视频显示器的特定模式。这个类包含了四个变量存储属性。第一个是分辨率，它被初始化为一个新的Resolution结构体的实例，属性类型被推断为Resolution。新VideoMode实例同时还会初始化其它三个属性，它们分别是，初始值为false的interlaced，初始值为0.0的frameRate，以及值为可选String的name。name属性会被自动赋予一个默认值nil，意为“没有name值”，因为它是一个可选类型。
 */


let someResolution = Resolution()

let someVideoMode = VideoMode()

someVideoMode.resolution.width = 1280

print(someVideoMode.resolution.width)


let vga = Resolution(width: 640, height: 480)

print(vga.width)
print(vga.height)


let hd = Resolution(width:1920, height:1080)
var cinema = hd

cinema.width

//改变了cinema的值，但是h的值没有改变
cinema.width = 2048
cinema.width
hd.width
//说明 结构体是值类型


enum CompassPoint {
    case North, South, East, West
}

var currentDirection = CompassPoint.West

let remenberedDirection = currentDirection

currentDirection = .East

if remenberedDirection == .West {
    print("仍然是 West")
}
//说明 枚举是值类型




//类是引用类型

let tenEighty = VideoMode()

let tenEighty2 = VideoMode()


tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEight = tenEighty

alsoTenEight.frameRate = 30.0

tenEighty.frameRate
//因为类是引用类型，所以tenEight和alsoTenEight实际上引用的是相同的VideoMode实例。换句话说，它们是同一个实例的两种叫法。
//足以说明 VideoMode类是引用类型，值已经被改变

//需要注意的是tenEighty和alsoTenEighty被声明为常量而不是变量。然而你依然可以改变tenEighty.frameRate和alsoTenEighty.frameRate，因为tenEighty和alsoTenEighty这两个常量的值并未改变。它们并不“存储”这个VideoMode实例，而仅仅是对VideoMode实例的引用。所以，改变的是被引用的VideoMode的frameRate属性，而不是引用VideoMode的常量的值。


//如果能够判定两个常量或者变量是否引用同一个类实例将会很有帮助。为了达到这个目的，Swift 内建了两个恒等运算符

if tenEighty === alsoTenEight {
    print("真")
}


print(tenEighty===tenEighty2)


/*
 按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
 
 1该数据结构的主要目的是用来封装少量相关简单数据值。
 2有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
 3该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
 4该数据结构不需要去继承另一个既有类型的属性或者行为。
 */




/*
 类和结构体的选择
 
 在你的代码中，你可以使用类和结构体来定义你的自定义数据类型。
 
 然而，结构体实例总是通过值传递，类实例总是通过引用传递。这意味两者适用不同的任务。当你在考虑一个工程项目的数据结构和功能的时候，你需要决定每个数据结构是定义成类还是结构体。
 
 按照通用的准则，当符合一条或多条以下条件时，请考虑构建结构体：
 
 该数据结构的主要目的是用来封装少量相关简单数据值。
 有理由预计该数据结构的实例在被赋值或传递时，封装的数据将会被拷贝而不是被引用。
 该数据结构中储存的值类型属性，也应该被拷贝，而不是被引用。
 该数据结构不需要去继承另一个既有类型的属性或者行为。
 举例来说，以下情境中适合使用结构体：
 
 1几何形状的大小，封装一个width属性和height属性，两者均为Double类型。
 2一定范围内的路径，封装一个start属性和length属性，两者均为Int类型。
 3三维坐标系内一点，封装x，y和z属性，三者均为Double类型。
 
 
 在所有其它案例中，定义一个类，生成一个它的实例，并通过引用来管理和传递。实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。
 
 Swift 中，许多基本类型，诸如String，Array和Dictionary类型均以结构体的形式实现。这意味着被赋值给新的常量或变量，或者被传入函数或方法中时，它们的值会被拷贝。
 
 Objective-C 中NSString，NSArray和NSDictionary类型均以类的形式实现，而并非结构体。它们在被赋值或者被传入函数或方法时，不会发生值拷贝，而是传递现有实例的引用。
 
 注意
 以上是对字符串、数组、字典的“拷贝”行为的描述。在你的代码中，拷贝行为看起来似乎总会发生。然而，Swift 在幕后只在绝对必要时才执行实际的拷贝。Swift 管理所有的值拷贝以确保性能最优化，所以你没必要去回避赋值来保证性能最优化。
 
 */






















