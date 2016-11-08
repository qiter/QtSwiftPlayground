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


























