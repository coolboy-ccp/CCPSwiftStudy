//
//  FirstDay.swift
//  CCPSwiftStudy
//
//  Created by liqunfei on 16/3/29.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

import UIKit

class FirstDay: NSObject {
   //常量声明
    let minNumber = 10
    let maxNumber: Int = 50
    //变量声明
    var currentNumber = 11
    var x = 1,y = 2,z: Float = 3.0
    //:后面跟着是变量的类型,如果给变量赋了初始值，一般可以不写类型，swift可以自行推断出变量类型(x,y为Int,z为Float)
    let 兀 = 3.14159
    let 你好 = "hello"
    let 😄😊 = "表情符"
    let happy = "happy"
    let minInt16Value = Int16.min
    let maxInt16Value = Int16.max
    //swift真心强，常量和变量名几乎能用任何字符
    func changeValue() {
        currentNumber = x + y
        var a,b,c: Float
        //a,b,c都为Float
        a = 1.0
        b = 1.0
        c = 1.0
        let d = a + b + c
        print(d)//打印d
        print("Today is first day \(happy)")
        let cat = "😍";print(cat)
        print(maxInt16Value)
        print(minInt16Value)
        let myUnit : UInt = 15
        print(myUnit)
        //UInt正整数
        //分号并不强制要求，但如果一行有多句代码就必须要分号
    }
    //关于swift和oc注释
    //相同点：
    // 
    /**/
    //不同点：
    /*
    我是第一个多行注释
    /*
    我是第二个多行注释
    */
    */
    func someAboutString() {
        //\(***)可以添加
        let apples = 3;
        let appleSummary = "I have \(apples) apples"
        print(appleSummary)
        //使用+拼接时必须保证类型一致，swift是强类型语言，不同类型不能相加
        let label = "The width is"
        let width = 94
        let labelWidth = label + String(width)
        print(labelWidth)
        
    }
    
    func someAboutArrayAndDictionary() {
        //array
        var shoppingList = ["catfish","water","tulips","blue paint"]
        shoppingList[1] = "bottle of water"
        print(shoppingList)
        
        //dictionary
        var occupations = ["Malcolm":"Captain","Kaylee":"Mechanic"]
        occupations["Jayene"] = "Public relations"
        print(occupations)
        
        var emptyArray = [String]()
        var emptyDictionary = [String:Float]()
        emptyArray = ["arr"]
        emptyDictionary = ["arr":12.0]
        print(emptyDictionary)
        print(emptyArray)
        let emptyArray1 = []
        let emptyDictionary1 = [:]
        print(emptyArray1)
        print(emptyDictionary1)
        
    }
    
}
