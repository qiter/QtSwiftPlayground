//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func greet(name:String, day:String)->String{
    return "Hello\(name),today is \(day)"
}

greet(name: "qiter", day: "monday")

/*
 
 闭包类型是由参数返回值决定，如上述add闭包类型为(Int,Int)->(Int)，箭头前面括号是参数类型，多个参数逗号隔开，箭头后面括号返回值类型。
 
 分析下上面代码，“=”左边的“ let add:(Int,Int)->(Int) ”意思是声明一个add常量，add是一个闭包类型，并且这个闭包的类型是：(Int,Int)->(Int)。
 
 “=”右边是一个代码块，即闭包的具体实现，相当于给左边add常量赋值。代码块的语法格式：
 
 {
 (参数1，参数2) in
 //code
 }
 参数和需执行的代码（code）用 关键字“in”隔开，如果闭包没有参数， “ () in”可以直接省略：
 
 {
 //code
 }
 
 
 */
//定义一个求和闭包
//闭包类型：(Int,Int)->(Int)
let add:(Int,Int)->(Int) = {
    (a,b) in
    return a + b
}
//执行闭包，相当于调用函数
let result = add(11, 22)
//打印闭包返回值
print("result=\(result)")





//异步回调
func requestData(urlString:String, succeed:((Any?)->())?, failure:((Any?)->())?){

    let request = URLRequest(url: URL(string: urlString)!)
    
    
    //发送网络请求，异步执行函数
    //if request == nil {
    //    succeed?()
    //}
    

}

func postWithPath(path: String,paras: Dictionary<String,Any>?,success: @escaping ((_ result: Any) -> ()),failure: @escaping ((_ error: Error) -> ())) {
    
    var i = 0
    var address: String = ""
    if let paras = paras {
        for (key,value) in paras {
            if i == 0 {
                address += "\(key)=\(value)"
            }else {
                address += "&\(key)=\(value)"
            }
            i += 1
        }
    }
    let url = URL(string: path)
    var request = URLRequest.init(url: url!)
    request.httpMethod = "POST"
    print(address)
    request.httpBody = address.data(using: .utf8)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request) { (data, respond, error) in
        
        if let data = data {
            
            if let result = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                
                success(result)
            }
            
        }else {
            failure(error!)
        }
    }
    dataTask.resume()
}

postWithPath(path: "http://www.qq.com", paras: ["name":"qiter","sex":"male"], success: {(result) in
    
    print(result)
    
}, failure: {(error) in
    
    print(result)

})



/*返回元组*/

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores:[5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.1)
print(statistics.2)

/*函数也可以当做参数传入另一个函数。*/
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list:numbers, condition: lessThanTen)

/*
函数实际上是一种特殊的闭包:它是一段能之后被调取的代码。闭包中的代码能访问闭包所建作用域中能得到的变量和函数，即使闭包是在一个不同的作用域被执行的 - 你已经在嵌套函数例子中所看到。你可以使用{}来创建一个匿名闭包。使用in将参数和返回值类型声明与闭包函数体进行分离。
*/

numbers.map({(number:Int)->Int in
    let result = 3*number
    return result
})











