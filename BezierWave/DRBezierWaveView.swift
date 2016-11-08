//
//  DRBezierWaveView.swift
//  BezierWave
//
//  Created by xqzh on 16/11/2.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class DRBezierWaveView: UIView {
  var offset    :CGFloat = 0 // 偏移量
  var speed     :CGFloat!    // 移动速度
  var waveHeight:CGFloat!    // 波浪高度
  var waveWidth :CGFloat!    // 波浪宽度
  var backg     :CAShapeLayer!
  var backg_    :CAShapeLayer!
  var bezierPath:UIBezierPath!
  
  override func draw(_ rect: CGRect) {
    // 增加layer
    backg = CAShapeLayer()
    backg.lineWidth   = 1
    backg.strokeColor = UIColor.clear.cgColor
    backg.fillColor   = UIColor.clear.cgColor
    backg.opacity     = 0.5
    
    // 增加layer1
    backg_ = CAShapeLayer()
    backg_.lineWidth   = 1
    backg_.strokeColor = UIColor.clear.cgColor
    backg_.fillColor   = UIColor.clear.cgColor
    backg_.opacity     = 0.5
    
    // 增加贝塞尔曲线
    bezierPath = UIBezierPath()
    
    self.layer.addSublayer(backg)
    self.layer.addSublayer(backg_)
    
    // 定时
    let link = CADisplayLink(target: self, selector: #selector(animation))
    link.add(to: RunLoop.main, forMode: .commonModes)
  }

  func animation() {
    // 第一个layer
    bezierPath.removeAllPoints()
    offset += speed
    
    var startY = Double(waveHeight)*Double(sinf(Float(M_PI*Double(offset)/Double(375.0))))
    
    bezierPath.move(to: CGPoint(x: 0, y: 240)) // 设置起点
    
    for i in 0...Int(waveWidth)-1 { // 终点和control点不用设置，通过下面的正弦函数计算，依靠addLine手动设置
      
      let a = 2.5*M_PI*Double(i)/Double(waveWidth)
      let b = Double(offset)*M_PI/Double(waveWidth)
      let y = Double(1.1)*Double(waveHeight)*Double(sinf(Float(a+b))) + Double(200)
      bezierPath.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
    }
    bezierPath.addLine(to: CGPoint(x: waveWidth, y: 240)) // 设置终点
    
    backg.fillColor = UIColor.lightGray.cgColor
    backg.opacity   = 0.5
    backg.path      = bezierPath.cgPath
    
    // 第二个layer
    bezierPath.removeAllPoints()
    offset += 2
    
    let startY2 = Double(waveHeight)*Double(sinf(Float(M_PI*Double(offset)/375.0)) + Float(M_PI/4));
    
    bezierPath.move(to: CGPoint(x: 0, y: 240))
    
    for i in 0...Int(waveWidth)-1 {
      
      let a = 2.5*M_PI*Double(i)/Double(waveWidth)
      let b = Double(3*offset)*M_PI/Double(waveWidth)
      let y = 10.0*sinf(Float(a+b+M_PI/4)) + 200
      
      bezierPath.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
    }
    bezierPath.addLine(to: CGPoint(x: waveWidth, y: 240))
    
    backg_.fillColor = UIColor.lightGray.cgColor
    backg_.opacity   = 0.5
    backg_.path      = bezierPath.cgPath

  }
  
}
