//
//  MyFlashLabel.swift
//  CCPSwiftStudy
//
//  Created by liqunfei on 16/4/5.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

import UIKit

class MyFlashLabel: UIView {
    var innerContainer: UIView
   /*
    计算text长度并返回
   */
    func evaluateContentWidth(text: String) -> CGFloat {
        var width: CGFloat = 0.0
        let options: NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        if text.characters.count > 0 {
           let attributedDic = [NSFontAttributeName : UIFont.systemFontOfSize(15.0)]
           let size: CGSize = text.boundingRectWithSize(CGSizeMake(CGFloat(MAXFLOAT), self.bounds.size.height), options: options, attributes:attributedDic, context: nil).size
           width = size.width
        }
        return width
    }
    
    /*
    初始化
    */
     init(frame: CGRect, text: String) {
        self.innerContainer = UIView()
        super.init(frame: frame)
        self.innerContainer = UIView(frame: self.bounds)
        self.innerContainer.backgroundColor = UIColor.clearColor()
        self.clipsToBounds = true
        self.backgroundColor = UIColor.yellowColor()
        self.addSubview(self.innerContainer)
        print(self.subviews.count)
        self.flashAnimation(text)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    动画
    */
    
    func flashAnimation(text: String) {
        self.innerContainer.layer.removeAnimationForKey("move")
        let width: CGFloat = self.evaluateContentWidth(text)
        let label1: UILabel = UILabel(frame: CGRectMake(0,0,width,self.bounds.size.height))
        label1.text = text
        label1.textColor = UIColor.greenColor()
        label1.font = UIFont.systemFontOfSize(15.0)
        label1.backgroundColor = UIColor.clearColor()
        self.innerContainer.addSubview(label1)
        if width > self.bounds.size.width {
            let label2: UILabel = UILabel(frame: CGRectMake(width + 50,0,width,self.bounds.size.height))
            label2.text = text
            label2.backgroundColor = UIColor.clearColor()
            label2.font = UIFont.systemFontOfSize(15.0)
            label2.textColor = UIColor.greenColor()
            self.innerContainer.addSubview(label2)
        }
        let moveAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position.x")
        moveAnimation.keyTimes = [0.0,1.0]
        moveAnimation.duration = Double(width)/50.0
        moveAnimation.values = [0,-width - 50]
        moveAnimation.repeatCount = MAXFLOAT
        moveAnimation.timingFunction = CAMediaTimingFunction(name: "linear")
        self.innerContainer.layer.addAnimation(moveAnimation, forKey: "move")
        
    }
}
