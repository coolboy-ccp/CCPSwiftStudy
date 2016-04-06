//
//  ASampleAnimation.swift
//  CCPSwiftStudy
//
//  Created by liqunfei on 16/3/31.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

import UIKit


class ASampleAnimation: UIView {
    //orerride表示继承父类的方法
    var sideLength: Double = 0.0 //属性的声明
    var name: String = ""
    var alayer: CALayer
    var isTouch: Bool = false
    init(name: String,frame: CGRect){
        self.alayer = CALayer()
        super.init(frame: frame)
        self.name  = name
        alayer.bounds = CGRectMake(0, 0, 100, 100)
        alayer.anchorPoint = CGPointMake(0.5, 0.5)
        alayer.position = self.center
        alayer.backgroundColor = UIColor.redColor().CGColor
        alayer.cornerRadius = 50
        self.layer.addSublayer(alayer);
        let square = Square(sideLength: 15.2, name: "square")
        let triangleAndSquare = TriangleAndSquare(size: 12, name: "triangle and square")
        print(triangleAndSquare.square.sideLength)
        print(triangleAndSquare.triangle.sideLength)
        triangleAndSquare.square = Square(sideLength: 50, name: "changeValue")
        print(triangleAndSquare.triangle.sideLength)
        square.area()
        print(square.simpleDescription())
        print("\(self.name) : \(self.frame)")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        isTouch = !isTouch
        if isTouch {
             alayer.bounds = CGRectMake(0, 0, 200, 100)
             alayer.backgroundColor = UIColor.orangeColor().CGColor
             alayer.position = self.center
        }
        else {
            alayer.bounds = CGRectMake(0, 0, 100, 100)
            alayer.backgroundColor = UIColor.redColor().CGColor
            alayer.position = CGPointMake(self.center.x, self.center.y - 100)
        }
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}

class namedShape {
    var numberOfSizes: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDescription() ->String {
        return "A shape with \(numberOfSizes) sides."
    }
}

class Square: namedShape {
    var sideLength: Double
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSizes = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDescription() -> String {
        return "A squre with sides of length \(sideLength)"
    }
}
//let square: Square = Square(sideLength: 15.0, name: "square")

class EquilateralTriangle: namedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double,name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSizes = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An enquilateral triangle with sides of length \(sideLength) and perimeter \(perimeter)"
    }
}

class TriangleAndSquare {
    
    //保证triangle和square的sidelength相等
    var triangle: EquilateralTriangle {
        willSet {
           square.sideLength = newValue.sideLength
        
        }
    }
    var square: Square {
        willSet {
            let card = Card(rank: .Queen, suit: .Spades)
            card.simpleDescaiption()
            let ace = Rank.ACE
            print("enum :\(ace.rawValue)")
            let three = Rank.three
            print("neum three : \(three)")
            let jack = Rank.Jack
            print("enum jack: \(jack)")
            print("enum jack: \(jack.simpleDescription())")
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double,name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

//枚举
enum Rank: Int {
    case ACE = 1
    case two,three,four,five,six,seven,eight,night,nine,ten
    case Jack,Queen,King
    func simpleDescription() -> String {
        switch self {
        case .ACE:
            return "ace"
        case .Jack:
            return"jack"
        case .Queen:
            return"queen"
        case .King:
            return"king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit {
    case Spades,Hearts,Diamonds,Clubs
    func simpleDescirption() -> String {
        switch self {
        case.Spades:
            return "spades"
        case.Hearts:
            return "hearts"
        case.Diamonds:
            return "diamonds"
        case.Clubs:
            return "clubs"
        }
    }
}

// 结构体
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescaiption(){
        print("The \(rank.simpleDescription()) of \(suit.simpleDescirption())")
    }
}
