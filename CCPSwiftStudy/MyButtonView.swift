//
//  MyButtonView.swift
//  CCPSwiftStudy
//
//  Created by liqunfei on 16/4/8.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

import UIKit

class MyButtonView: UIView {
    var boardRect: CGRect?
    var image: UIImage?
    var isOn: Bool = false
    var buttons: NSArray?
    var selfCenter: CGPoint {
        get {
            return CGPointMake(self.bounds.size.width*0.5, self.bounds.size.height*0.5)
        }
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        let imgView: UIImageView = UIImageView(image: self.image ?? UIImage(named: "folder"))
        imgView.bounds = self.bounds;
        imgView.center = self.selfCenter
        imgView.userInteractionEnabled = true
        self.addSubview(imgView)
        let longPress: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: Selector("longPress:"))
        longPress.minimumPressDuration = 0.5
        imgView.addGestureRecognizer(longPress)
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("tap:"))
        tap.numberOfTapsRequired = 2
        imgView.addGestureRecognizer(tap)
        for i in 0..<self.buttons!.count {
            let button: UIButton = self.buttons![i] as! UIButton
            button.bounds = CGRectMake(0, 0, 40, 40);
            button.center = self.selfCenter
            self.addSubview(button)
        }
        self.bringSubviewToFront(imgView)
    }
    
    
    func tap(sender: UITapGestureRecognizer) {
        print("tap")
        self.disperse()
    }
    
    func longPress(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizerState.Began {
            print("longPress")
            self.disperse()
        }
    }
    
    func getMaxMinAngle(rect:CGRect,var rad: CGFloat) -> NSDictionary{
        var angle: CGFloat = 0
        var startAngle: CGFloat = 0
        var endAngle: CGFloat = 0
        rad += CGFloat(20)
        var lastPoint: CGPoint = CGPointMake(self.center.x + rad, self.center.y)
        let marr: NSMutableArray = []
        let step: CGFloat = CGFloat(M_PI * 0.01)
        let count: Int = Int(CGFloat(M_PI * 4) / step)
        for _ in 0..<count {
            angle += step
            let x = rad * cos(angle) + center.x
            let y = rad * sin(angle) + center.y
            let point = CGPointMake(x, y)
            if !CGRectContainsPoint(rect, lastPoint) && CGRectContainsPoint(rect, point) {
                startAngle = angle
            }
            if CGRectContainsPoint(rect, lastPoint) && CGRectContainsPoint(rect, point) {
                endAngle = angle
                marr.addObject(startAngle)
                marr.addObject(endAngle)
            }
            lastPoint = point
        }
        var maxInterver: CGFloat = 0;
        for var i = 0;i < marr.count;i += 2 {
            let start: CGFloat = CGFloat(marr[i] as! NSNumber)
            let end: CGFloat = CGFloat(marr[i + 1] as! NSNumber)
            if end - start > maxInterver {
                startAngle = start
                endAngle = end
                maxInterver = end - start
            }
        }
        return ["start":startAngle,"end":endAngle]
    }
    
    func adapTableAngel(rect: CGRect,var radius:CGFloat) -> NSDictionary {
        let dict: NSDictionary = self.getMaxMinAngle(rect, rad: radius)
        let startAngle: CGFloat = CGFloat(dict["start"] as! NSNumber)
        let endAngle: CGFloat = CGFloat(dict["end"] as! NSNumber)
        if (endAngle - startAngle) * radius < CGFloat(buttons!.count * 50) {
            radius += 10
            let orignRect = CGRectMake(self.center.x - radius - 25, self.center.y - 25 - radius, 2 * radius + 50, 2 * radius + 50)
            let interRect = CGRectIntersection(orignRect, self.boardRect!)
            return self.adapTableAngel(interRect, radius: radius)
        }
        else {
            return ["start":startAngle,"end":endAngle,"rad":radius]
        }
        
    }
    
    func disperse() {
        var startAngle: CGFloat = 0.0
        var angle: CGFloat = CGFloat(2 * M_PI) / CGFloat(self.buttons!.count)
        var rad: CGFloat = 50/angle
        let orignRect = CGRectMake(self.center.x - rad - 40, self.center.y - rad - 40, 2 * rad + 50, 2 * rad + 50)
        if !CGRectContainsRect(self.boardRect!, orignRect) {
            let intertRect: CGRect = CGRectIntersection(orignRect, self.boardRect!)
            print(intertRect)
            let dict: NSDictionary = self.adapTableAngel(intertRect, radius: rad)
            let start: CGFloat = CGFloat(dict["start"] as! NSNumber)
            let end: CGFloat = CGFloat(dict["end"] as! NSNumber)
            rad = CGFloat(dict["rad"] as! NSNumber)
            angle = (end - start) / CGFloat(self.buttons!.count)
            startAngle = start + angle * 0.5
        }
        for i in 0..<self.buttons!.count {
            let x: CGFloat = rad * cos(CGFloat(i) * angle + startAngle)
            let y: CGFloat = rad * sin(CGFloat(i) * angle + startAngle)
            let button: UIButton = self.buttons![i] as! UIButton
            UIView.animateWithDuration(0.05, delay: 0.05 * Double(i), options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                button.transform = CGAffineTransformIsIdentity(button.transform) ? CGAffineTransformMakeTranslation(x, y) : CGAffineTransformIdentity
                }, completion: nil)
            
            
        }
    }
    
    func changeFrameWithPoint(point: CGPoint) {
        self.center = point;
        for i in 0..<self.buttons!.count {
            let button: UIButton = self.buttons![i] as! UIButton
            UIView.animateWithDuration(0.05, delay: Double(i) * 0.05, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                button.transform = CGAffineTransformIdentity
                }, completion: nil)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let p: CGPoint = ((touches as NSSet).anyObject()?.locationInView(nil))!
        self.isOn = CGRectContainsPoint(self.frame, p)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let p: CGPoint = ((touches as NSSet).anyObject()?.locationInView(nil))!
        if isOn {
            self.changeFrameWithPoint(p)
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
