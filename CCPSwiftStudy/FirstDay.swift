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
    func achieveFuction() {
        self.changeValue();
        self.someAboutString()
        self.someAboutArrayAndDictionary()
        self.controlStyle()
    }
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
    
    //字符串
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
    //字典和数组
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
    //控制流
    /*
    if,switch做逻辑判断,for-in,for,while,repeat-while做循环。不强制用小括号括起来条件，但是花括号是必须的
     */
    func controlStyle() {
        let individualScores = [75,43,103,87,12,33]
        var teamSore = 0;
        for score in individualScores {
            //在if语句中，条件必须是布尔表达式，不再隐式与零做计算
            if score > 50 {
                teamSore += 3
            }
            else {
                teamSore += 1
            }
        }
        print(teamSore)
        
        //?表示可选类型，包括一个值和一个nil
        let optionalString: String? = "optionalString"
        print(optionalString == nil)
        
        
        //如果optionalName为nil则if会被跳过
        let optionalName: String? = "John"
        var greeting = "Hello"
        if let name = optionalName {
            greeting = "Hello,\(name)"
        }
        print(greeting)
        
        let nickName:String? = nil
        let fullName:String = "John"
        let informalGreeting = "hi\(nickName ?? fullName)"
        print(informalGreeting)
        
        //switch支持任意类型的数据和各种类型的比较操作
        let vegetable = "red pepper"
        switch vegetable {
        case "celery":
            print("Add some raisins and make ants on a log")
        case "cucumber","watercress":
            print("That would make a good tea sandwich")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)?")
        default:
            print("Everything tastes good in soup")
        }
        
        //for-in
        let interestingNumbers = ["Prime":[1,35,8,46],"Fibonacci":[2,5,7,9,6,5],"Square":[55,44,99,66]]
        var largest = 0
        for (_,numbers) in interestingNumbers {
            for number in numbers {
                if number > largest {
                    largest = number;
                }
            }
        }
        print(largest)
        
        //while repeat-while
        var n = 2
        while n < 100 {
            n = n * 2
        }
        print(n)
        
        var m = 2
        repeat {
        m = m * 2
        } while m < 100
        print(m)
        
        //使用..<来创造一个序列区间(..<不包含最大值的区间,...包含最大值和最小值的区间)
        var firstForLoop = 0
        for i in 0..<4 {
            firstForLoop += i
        }
        print(firstForLoop)
    }
}
