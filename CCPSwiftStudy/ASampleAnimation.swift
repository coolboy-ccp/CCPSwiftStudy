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
      super.init(frame: frame)
      self.name  = name
      print("\(self.name) : \(self.frame)")
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
