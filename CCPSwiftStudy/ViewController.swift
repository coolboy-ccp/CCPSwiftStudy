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
        print(sidelength)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

