# GradientColorDemo
苹果官网 iPhone X 广告，渐变动画效果

## Effect 效果
Gif 展示：

![](http://og1yl0w9z.bkt.clouddn.com/17-10-17/73624345.jpg)

😆，闪瞎吧

## Usage 使用方法
```
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
```
