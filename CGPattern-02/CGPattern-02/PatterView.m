//
//  PatterView.m
//  CGPattern-02
//
//  Created by long on 6/27/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "PatterView.h"
#define H_PATTERN_SIZE 10
#define V_PATTERN_SIZE 10
#define H_PSIZE H_PATTERN_SIZE + 5
#define V_PSIZE H_PATTERN_SIZE + 10

#define PSIZE  16

void MyDrawColoredPattern(void *info, CGContextRef myContext) {
    CGFloat subunit = 5;
    
    CGSize size = {subunit, subunit};
    CGPoint point1 = {0,0}, point2 = {subunit, subunit}, point3 = {0,subunit}, point4 = {subunit,0};
    CGRect myRect1 = {point1, size}, myRect2 = {point2, size}, myRect3 = {point3, size}, myRect4 = {point4, size};
    
    CGContextSetRGBFillColor (myContext, 0, 0, 1, 0.5);
    CGContextFillRect (myContext, myRect1);
    CGContextSetRGBFillColor (myContext, 1, 0, 0, 0.5);
    CGContextFillRect (myContext, myRect2);
    CGContextSetRGBFillColor (myContext, 0, 1, 0, 0.5);
    CGContextFillRect (myContext, myRect3);
    CGContextSetRGBFillColor (myContext, .5, 0, .5, 0.5);
    CGContextFillRect (myContext, myRect4);
}

// 绘制模板图案单元的回调函数
void MyDrawStencilStar(void *info, CGContextRef myContext){
    int k;
    double r, theta;
    
    r = 0.8 * PSIZE / 2;
    theta = 2 *M_PI *(2.0 / 5.0);
    CGContextTranslateCTM(myContext, PSIZE/2, PSIZE/2);
    CGContextMoveToPoint(myContext, 0, r);
    for (k = 1; k < 5; k++) {
        CGContextAddLineToPoint(myContext, r*sin(k*theta), r*cos(k*theta));
    }
    
    CGContextClosePath(myContext);
    CGContextFillPath(myContext);
    
}

void MyStencilPatternPaiting(CGContextRef myContext){
    
    //设置模板图案的颜色空间
    CGPatternRef pattern;
    CGColorSpaceRef baseSpace;
    CGColorSpaceRef patternSpace;
    static const CGFloat color[4] = {0,1,0,1};
    static const CGPatternCallbacks callBacks = {0, &MyDrawStencilStar,NULL};
    baseSpace = CGColorSpaceCreateDeviceRGB();
    patternSpace = CGColorSpaceCreatePattern(baseSpace);
    CGContextSetFillColorSpace(myContext, patternSpace);
    CGColorSpaceRelease(baseSpace);
    CGColorSpaceRelease(patternSpace);
    
    //设置模板图案的骨架（Anatomy）
    // 设置模板图案的骨架（Anatomy）与设置着色图案一样，不同的是 isColored 参数需要传递 false。

    pattern = CGPatternCreate(NULL, CGRectMake(0, 0, PSIZE, PSIZE), CGAffineTransformIdentity, PSIZE, PSIZE, kCGPatternTilingConstantSpacing, false, &callBacks);
    //指定模板图案作为填充或描边图案
    CGContextSetFillPattern(myContext, pattern, color);
    CGPatternRelease(pattern);
    CGContextFillRect(myContext, CGRectMake(0, 0, PSIZE*20, PSIZE*20));
    
}

void MyColoredPatternPainting(CGContextRef myContext, CGRect rect){
    CGPatternRef pattern;
    CGColorSpaceRef patternSpace;
    CGFloat alpha = 1;
    static const CGPatternCallbacks callBacks = {0, &MyDrawColoredPattern, NULL};
        
    CGContextSaveGState(myContext);
    patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(myContext, patternSpace);
    CGColorSpaceRelease(patternSpace);
        /**
         *  设置着色图案的骨架（Anatomy）
         *
         *  @param info           是一个指针，指向我们要传递给绘制回调函数的数据
         *  @param bound          指定图案单元的大小
         *  @param matrix          指定图案的变换矩阵，它将图案空间坐标系统映射到图形上下文的默认坐标系统。如果希望两个坐标系统是一样的，则可以使用单位矩阵。
         *  @param xStep, yStep：指定单元之间的水平和竖直间距  
         *  @param tiling 平铺模式，可以是kCGPatternTilingNoDistortion、kCGPatternTilingConstantSpacingMinimalDistortion、kCGPatternTilingConstantSpacing
         *  @param isColored：指定图案单元是着色图案（true）还是模板图案（false）
         *  @param callbacks：是一个指向 CGPatternCallbacks 结构体的指针，定义如下。
         */
    pattern = CGPatternCreate(NULL, CGRectMake(0, 0, H_PATTERN_SIZE, V_PATTERN_SIZE), CGAffineTransformMake(1, 0, 0, 1, 0, 0), H_PSIZE, V_PSIZE, kCGPatternTilingConstantSpacing, true, &callBacks);
    
    //指定着色图案作为填充或描边图案
    CGContextSetFillPattern(myContext, pattern, &alpha);
    CGPatternRelease(pattern);
    CGContextFillRect(myContext, rect);
    CGContextRestoreGState(myContext);
}
    
    
@interface PatterView ()

@end

@implementation PatterView
    
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
//    MyColoredPatternPainting(context, self.bounds);
    MyStencilPatternPaiting(context);
}
    
@end
