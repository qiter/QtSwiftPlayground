//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"




struct TimesTable {
    var multiplier: Int = 0
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}


var threeTimesTable = TimesTable()
threeTimesTable.multiplier = 3

threeTimesTable[6]

//--------------------------------


/*
 虽然接受单一入参的下标是最常见的，但也可以根据情况定义接受多个入参的下标。例如下例定义了一个Matrix结构体，用于表示一个Double类型的二维矩阵。Matrix结构体的下标接受两个整型参数：
 */

struct Matrix {
    //初始化属性必须又赋值
    //init中必须全部赋值
    var rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int ) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValidForRow(row: Int, column: Int ) -> Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
    
        get {
            assert(indexIsValidForRow(row: row, column: column),"数组下标越界")
            return grid[ row * columns + column]
        }
        set {
            
            assert(indexIsValidForRow(row: row, column: column),"数组下标越界")
            grid[(row * columns) + column] = newValue
        }
    
    }
    
    
    
}

/*
 
 Matrix提供了一个接受两个入参的构造方法，入参分别是rows和columns，创建了一个足够容纳rows * columns个Double类型的值的数组。通过传入数组长度和初始值0.0到数组的构造器，将矩阵中每个位置的值初始化为0.0。关于数组的这种构造方法请参考创建一个空数组。
 
 你可以通过传入合适的row和column的数量来构造一个新的Matrix实例：
 
 */


var matrix = Matrix(rows: 2, columns: 2)
matrix.rows
matrix.columns
matrix.grid

matrix[0, 1] = 1.5
matrix[1, 0] = 3.2

matrix.grid


//触发断言
//var someValue = matrix[2, 2]




































