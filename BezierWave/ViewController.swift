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
    let v = DRBezierWaveView(frame: self.view.frame) as DRBezierWaveView
    v.speed      = 2
    v.waveHeight = 10.0
    v.waveWidth  = 375.0
    v.backgroundColor = UIColor.white
    self.view.addSubview(v)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

