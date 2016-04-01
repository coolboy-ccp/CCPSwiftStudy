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
    //get,set方法声明属性
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
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


