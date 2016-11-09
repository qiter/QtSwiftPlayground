//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


/*
 
 闭包表达式语法（Closure Expression Syntax）
 
 闭包表达式语法有如下的一般形式：
 
 { (parameters) -> returnType in
 statements
 }
 
*/


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1:String, _ s2:String)->Bool{
    return s1>s2
}

var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: {(s1:String,s2:String)->Bool in return s1<s2})

reversedNames

reversedNames = names.sorted(by: {s1,s2 in return s1<s2})

reversedNames

reversedNames = names.sorted(by: {s1,s2 in s1>s2})

/*
单行表达式闭包可以通过省略 return 关键字来隐式返回单行表达式的结果，如上版本的例子可以改写为：
*/

reversedNames

reversedNames = names.sorted(by: {$0<$1})

reversedNames

reversedNames = names.sorted(by: >)


/**
 尾随闭包（Trailing Closures）
 
 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签：
 */

func someFunctionThatTakesAClosure(closure:()->Void){
    //
    print("函数主体部分")
}

someFunctionThatTakesAClosure(closure:{
    print("闭包主体")
})

//使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(){
    
}

//在闭包表达式语法一节中作为 sorted(by:) 方法参数的字符串排序闭包可以改写为：

reversedNames = names.sorted(){$0>$1}

reversedNames

//如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉：

reversedNames = names.sorted{$0>$1}
reversedNames

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map{
    (number)->String in
    var number = number
    var output = ""
    repeat{
        output = digitNames[number % 10]! + output
        number /= 10
    }while number>0
    return output
}

strings







var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
customersInLine.count

let customerProvider = {customersInLine.remove(at: 0)}
customersInLine.count

customerProvider()

customersInLine.count


/*
 尽管在闭包的代码中，customersInLine 的第一个元素被移除了，不过在闭包被调用之前，这个元素是不会被移除的。如果这个闭包永远不被调用，那么在闭包里面的表达式将永远不会执行，那意味着列表中的元素永远不会被移除。请注意，customerProvider 的类型不是 String，而是 () -> String，一个没有参数且返回值为 String 的函数。
 
 将闭包作为参数传递给函数时，你能获得同样的延时求值行为。
*/

customersInLine

func serve(customer customerProvider:()->String){
    print("启动 serving \(customerProvider())")
}

serve(customer: {customersInLine.remove(at: 0)})

customersInLine

/*
 如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。@escaping 属性的讲解见上面的逃逸闭包。
 */

// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []

func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// 打印出 "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// 打印出 "Now serving Barry!"
// 打印出 "Now serving Daniella!"
/*
在上面的代码中，collectCustomerProviders(_:) 函数并没有调用传入的 customerProvider 闭包，而是将闭包追加到了 customerProviders 数组中。这个数组定义在函数作用域范围外，这意味着数组内的闭包能够在函数返回之后被调用。因此，customerProvider 参数必须允许“逃逸”出函数作用域。
*/














