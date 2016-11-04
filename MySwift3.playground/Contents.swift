//: Playground - noun: a place where people can play

import UIKit

var message = "Hello, playground"

let messageLength = message.characters.count

//message.remove(at: message.startIndex)
//message.insert("q", at: message.endIndex)


let index = message.index(message.startIndex, offsetBy: 2)
let index2 = message.index(message.endIndex, offsetBy: -2)
let suffix = message.substring(from: index)

message.substring(to: index)

let swi = "我是一只猿"

swi.hasPrefix("我")
swi.hasSuffix("猿")

//for code in swi.utf8{
    //print("\(code)")
//}

print(messageLength)
print(message)



/*
 截取字符串扩展
 var message = "Hello, playground"
 var messageSub = message[startPos: 1]
 print(messageSub)------ello, playground
 
 var messageSub2 = message[startPos: 1, endPos: 12]
 print(messageSub2)------ello, playg
 
 */
extension String {
    subscript (startPos fromId:Int) -> String {
        get {
            let s = self
            let len = s.characters.count
            if(fromId >= 0){
                if let range = s.range(of: s) {
                    let lo = s.index(range.lowerBound, offsetBy: fromId)
                    let hi = s.index(range.lowerBound, offsetBy: len)
                    let subRange = lo ..< hi
                    return s[subRange]
                }
                return ""
            }
            return ""
        }
    }
    
    subscript (startPos fromId:Int, endPos to:Int ) -> String {
        get {
            let s = self
            let len = s.characters.count
            let to = to>=len ? len : to
            if(fromId >= 0){
                if let range = s.range(of: s) {
                    let lo = s.index(range.lowerBound, offsetBy: fromId)
                    let hi = s.index(range.lowerBound, offsetBy: to)
                    let subRange = lo ..< hi
                    return s[subRange]
                }
                return ""
            }
            return ""
        }
    }

}





func cutString(contentStr s:String,startPos fromId:Int,endPos to:Int)->String{
    if let range = s.range(of: s) {
        let lo = s.index(range.lowerBound, offsetBy: fromId)
        let hi = s.index(range.lowerBound, offsetBy: to)
        let subRange = lo ..< hi
        return s[subRange] // "DE"
    }
    return ""
}

var str = cutString(contentStr:message,startPos: 1, endPos: 5)
print(str)

var messageSub = message[startPos: 1, endPos: 12]
print(messageSub)
var messageSub2 = message[startPos: 1]
print(messageSub2)




var test = "11111111111test"

if(test.range(of: "test") != nil){
    test.range
    print(test.range(of: "test")!.upperBound)
}

var string = "Hello-Swift"
//获取某个下标后一个下标对应的字符 char="e"
//swift2.2
//var char = string[startIndex.successor()]
//swift3.0
var char = string[string.index(after: message.startIndex)]


var range = string.range(of: "lo")
//let lo = string.index(range.lowerBound, offsetBy: fromId)
let lo = string.index((range?.lowerBound)!, offsetBy: 0)
print(lo)










