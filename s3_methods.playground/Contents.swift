//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 实例方法 (Instance Methods)
 
 实例方法是属于某个特定类、结构体或者枚举类型实例的方法。实例方法提供访问和修改实例属性的方法或提供与实例目的相关的功能，并以此来支撑实例的功能。实例方法的语法与函数完全一致，详情参见函数。
 
 实例方法要写在它所属的类型的前后大括号之间。实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。实例方法只能被它所属的类的某个特定实例调用。实例方法不能脱离于现存的实例而被调用。
 
 下面的例子，定义一个很简单的Counter类，Counter能被用来对一个动作发生的次数进行计数：
 */

class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    
    
    func reset(){
        count = 0
    }
}


let counter = Counter()
counter.increment()

counter.count

counter.incrementBy(amount: 5)

counter.count

counter.reset()

counter.count




class Counter2 {
    var count: Int = 0
    func incrementBy(amount: Int, numberofTimes: Int){
        count += (amount * numberofTimes)
    }
    func increment(){
        self.count += 1
    }
}


let counter2 = Counter2()
counter2.count

counter2.incrementBy(amount: 10, numberofTimes: 5)

counter2.count


counter2.increment()

counter2.count


//---------------------------------------
/*
 在实例方法中修改值类型(Modifying Value Types from Within Instance Methods)
 
 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。
 
 但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择可变(mutating)行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会在方法执行结束时写回到原始结构中。方法还可以给它隐含的self属性赋予一个全新的实例，这个新实例在方法结束时会替换现存实例。
 
 要使用可变方法，将关键字mutating 放到方法的func关键字之前就可以了：
 */

struct Point {
    
    var x = 0.0, y = 0.0
    
    func isToTheRightOfx(x:Double) -> Bool {
        return (self.x > x)
    }
    
    mutating func moveByX(deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
    
    
}


var somePoint = Point(x: 4.0, y: 5.0)

if somePoint.isToTheRightOfx(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

somePoint.moveByX(deltaX: 2.0, y: 3.0)



//类型方法
/*
 
 实例方法是被某个类型的实例调用的方法。你也可以定义在类型本身上调用的方法，这种方法就叫做类型方法（Type Methods）。在方法的func关键字之前加上关键字static，来指定类型方法。类还可以用关键字class来允许子类重写父类的方法实现。
 
 注意
 在 Objective-C 中，你只能为 Objective-C 的类类型（classes）定义类型方法（type-level methods）。在 Swift 中，你可以为所有的类、结构体和枚举定义类型方法。每一个类型方法都被它所支持的类型显式包含。
 
 类型方法和实例方法一样用点语法调用。但是，你是在类型上调用这个方法，而不是在实例上调用。下面是如何在SomeClass类上调用类型方法的例子：
 
 */

class SomeClas {
    class func someTypeMethod() {
        print("类型方法")
    }
}

SomeClas.someTypeMethod()



/*
 下面的例子定义了一个名为LevelTracker结构体。它监测玩家的游戏发展情况（游戏的不同层次或阶段）。这是一个单人游戏，但也可以存储多个玩家在同一设备上的游戏信息。
 
 游戏初始时，所有的游戏等级（除了等级 1）都被锁定。每次有玩家完成一个等级，这个等级就对这个设备上的所有玩家解锁。LevelTracker结构体用类型属性和方法监测游戏的哪个等级已经被解锁。它还监测每个玩家的当前等级。
 */

struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    
    static func levelIsUnlocked(level: Int ) -> Bool {
        return level < highestUnlockedLevel
    }
    
    var currentLevel = 1
    
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level: level){
            currentLevel = level
            return true
        }else {
            return false
        }
    }
    
    
    
}



class Player {
    var traker = LevelTracker()
    var playerName: String = ""
    
    func completedLevel(level: Int ) -> Void {
        LevelTracker.unlockLevel(level: level+1)
        traker.advanceToLevel(level: level+1)
    }
    
    init(name: String){
        playerName = name
    }
    
}


var player = Player(name: "qiter")
player.completedLevel(level: 1)
if player.traker.advanceToLevel(level: 6) {
    print(player.traker.currentLevel)
}else{
    print("6级别没有解锁")
}





































