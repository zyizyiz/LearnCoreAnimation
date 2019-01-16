/*
 
 UIView有三个比较重要的布局属性：frame，bounds和center
 CALayer对应地叫做frame，bounds和position
 为了能清楚区分，CALayer用了“position”，UIView用了“center”，但是他们都代表同样的值。
 
 frame代表了图层的外部坐标（也就是在父图层上占据的空间）
 bounds是内部坐标（{0, 0}通常是图层的左上角）
 center和position都代表了相对于父图层anchorPoint所在的位置。
 anchorPoint :
    图层的anchorPoint通过position来控制它的frame的位置，可以认为anchorPoint是用来移动图层的把柄。
    默认来说，anchorPoint位于图层的中点，坐标是{0.5, 0.5}
 
 
 视图的frame，bounds和center属性仅仅是存取方法
 当操纵视图的frame，实际上是在改变位于视图下方CALayer的frame，不能够独立于图层(CALayer)之外改变视图(UIView)的frame。
 
 
 ****
 记住当对图层做变换的时候，比如旋转或者缩放，frame实际上代表了覆盖在图层旋转之后的整个轴对齐的矩形区域，也就是说frame的宽高可能和bounds的宽高不再一致了
 
 例如 ：◇
 */
