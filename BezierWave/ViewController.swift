//
//  ViewController.swift
//  BezierWave
//
//  Created by xqzh on 16/11/2.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    let v = DRBezierWaveView(frame: self.view.frame)
    v.backgroundColor = UIColor.white
    self.view.addSubview(v)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

