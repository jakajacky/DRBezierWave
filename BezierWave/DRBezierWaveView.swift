//
//  DRBezierWaveView.swift
//  BezierWave
//
//  Created by xqzh on 16/11/2.
//  Copyright © 2016年 xqzh. All rights reserved.
//

import UIKit

class DRBezierWaveView: UIView {
  var offset:CGFloat = 0
  var backg:CAShapeLayer!
  var backg_:CAShapeLayer!
  var bezierPath:UIBezierPath!
  override func draw(_ rect: CGRect) {
    // 增加layer
    backg = CAShapeLayer()
    backg.lineWidth = 1
    backg.strokeColor = UIColor.clear.cgColor
    backg.fillColor = UIColor.clear.cgColor
    backg.opacity = 0.5
    
    // 增加layer1
    backg_ = CAShapeLayer()
    backg_.lineWidth = 1
    backg_.strokeColor = UIColor.clear.cgColor
    backg_.fillColor = UIColor.clear.cgColor
    backg_.opacity = 0.5
    
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
    offset += 2
    
    var startY = 10.0*sinf(Float(M_PI*Double(offset)/375.0))
    print(startY)
    bezierPath.move(to: CGPoint(x: 0, y: 240)) // 设置起点
    // 终点和control点不用设置，通过下面的正弦函数计算，依靠addLine手动设置
    for i in 0...374 {
      let a = 2.5*M_PI*Double(i)/375.0
      let b = Double(offset)*M_PI/375.0
      let y = 1.1*10.0*sinf(Float(a+b)) + 200
      bezierPath.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
    }
    bezierPath.addLine(to: CGPoint(x: 375, y: 240)) // 设置终点
    
    backg.fillColor = UIColor.lightGray.cgColor
    backg.opacity = 0.5
    backg.path = bezierPath.cgPath
    
    // 第二个layer
    bezierPath.removeAllPoints()
    offset += 2
    
    
    let startY2 = 10.0*sinf(Float(M_PI*Double(offset)/375.0) + Float(M_PI/4));
    print(startY)
    bezierPath.move(to: CGPoint(x: 0, y: 240)) // 设置起点
    // 终点和control点不用设置，通过下面的正弦函数计算，依靠addLine手动设置
    for i in 0...374 {
      let a = 2.5*M_PI*Double(i)/375.0
      let b = Double(3*offset)*M_PI/375.0
      let y = 10.0*sinf(Float(a+b+M_PI/4)) + 200
      bezierPath.addLine(to: CGPoint(x: CGFloat(i), y: CGFloat(y)))
    }
    bezierPath.addLine(to: CGPoint(x: 375, y: 240)) // 设置终点
    
    backg_.fillColor = UIColor.lightGray.cgColor
    backg_.opacity = 0.5
    backg_.path = bezierPath.cgPath

  }
  
}
