//
//  ViewController.swift
//  CCPSwiftStudy
//
//  Created by liqunfei on 16/3/29.
//  Copyright © 2016年 chuchengpeng. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let first = FirstDay();
        first.achieveFuction()
        let animation: ASampleAnimation? = ASampleAnimation(name: "animation",frame: self.view.bounds)
        let sidelength = animation?.sideLength
        self.view.addSubview(animation!)
        print(sidelength)
        let labelView: MyFlashLabel = MyFlashLabel(frame: CGRectMake(20, 20, UIScreen.mainScreen().bounds.size.width, 30), text: "你是风儿我是沙，我是天鹅，你是癞蛤蟆，我是天才，你是大傻瓜，我是云儿，你是泥巴")
        self.view.addSubview(labelView)
        let bb:BBFlashCtntLabel = BBFlashCtntLabel(frame: CGRectMake(20, 50, UIScreen.mainScreen().bounds.size.width, 30))
        bb.text = "你是风儿我是沙，我是天鹅，你是癞蛤蟆，我是天才，你是大傻瓜，我是云儿，你是泥巴"
        bb.textColor = UIColor.redColor()
        bb.font = UIFont.systemFontOfSize(15.0)
        bb.repeatCount = 0
        bb.leastInnerGap = 20
        bb.reloadView()
        self.view.addSubview(bb);
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

