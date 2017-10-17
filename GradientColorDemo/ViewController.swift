//
//  ViewController.swift
//  GradientColorDemo
//
//  Created by WhatsXie on 2017/10/17.
//  Copyright © 2017年 WhatsXie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CAAnimationDelegate {
    
    //共三组渐变色
    let colorsSet = [
        [UIColor.yellow.cgColor, UIColor.orange.cgColor],
        [UIColor.cyan.cgColor, UIColor.green.cgColor],
        [UIColor.magenta.cgColor, UIColor.blue.cgColor],
        ]
    
    //当前渐变色索引
    var currentIndex = 0
    
    //渐变层
    var gradientLayer:CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //单击监听
        let tapSingle=UITapGestureRecognizer(target:self,action:#selector(tapSingleDid))
        tapSingle.numberOfTapsRequired = 1
        tapSingle.numberOfTouchesRequired = 1
        self.view.addGestureRecognizer(tapSingle)
        
        //创建CAGradientLayer对象
        gradientLayer = CAGradientLayer()
        //设置初始渐变色
        gradientLayer.colors = colorsSet[0]
        //每种颜色所在的位置
        gradientLayer.locations = [0.0, 1.0]
        
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = self.view.frame
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc func tapSingleDid(){
        //下一组渐变色索引
        var nextIndex = currentIndex + 1
        if nextIndex >= colorsSet.count {
            nextIndex = 0
        }
        
        //添加渐变动画
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        colorChangeAnimation.delegate = self
        colorChangeAnimation.duration = 2.0
        colorChangeAnimation.fromValue = colorsSet[currentIndex]
        colorChangeAnimation.toValue = colorsSet[nextIndex]
        colorChangeAnimation.fillMode = kCAFillModeForwards
        //动画结束后保持最终的效果
        colorChangeAnimation.isRemovedOnCompletion = false
        gradientLayer.add(colorChangeAnimation, forKey: "colorChange")
        
        //动画播放后改变当前索引值
        currentIndex = nextIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

