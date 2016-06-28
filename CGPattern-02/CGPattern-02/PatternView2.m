//
//  PatternView2.m
//  CGPattern-02
//
//  Created by long on 6/27/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "PatternView2.h"
#import <CoreGraphics/CoreGraphics.h>

#define TILE_SIZE  16

// 绘制回调
void drawPatternCallback(void *info , CGContextRef ctx){
   // 有颜色填充
    CGContextSetRGBFillColor(ctx, 1.0, 0.0, 0.0, 1.0);// 设置填充颜色
    CGContextFillRect(ctx, CGRectMake(0, 0, TILE_SIZE, TILE_SIZE));
    CGContextFillRect(ctx, CGRectMake(TILE_SIZE, TILE_SIZE, TILE_SIZE, TILE_SIZE));
}


void releaseInfoCallback(void* info){
    
}


@implementation PatternView2

- (void)drawBackgoundWithColorPattern:(CGContextRef )context{
    //模式填充颜色空间,注意对于有颜色填充模式，这里传NULL
    CGColorSpaceRef colorSpace = CGColorSpaceCreatePattern(NULL);
    //将填充色颜色空间设置为模式填充的颜色空间
    CGContextSetFillColorSpace(context, colorSpace);
    //填充模式回调函数结构体
    CGPatternCallbacks callback={0, &drawPatternCallback, &releaseInfoCallback};
    
    /*填充模式
     info://传递给callback的参数
     bounds:瓷砖大小
     matrix:形变
     xStep:瓷砖横向间距
     yStep:瓷砖纵向间距
     tiling:贴砖的方法
     isClored:绘制的瓷砖是否已经指定了颜色(对于有颜色瓷砖此处指定位true)
     callbacks:回调函数
     */
    CGPatternRef pattern = CGPatternCreate(NULL,
                                           CGRectMake(0, 0, 2 * TILE_SIZE, 2 * TILE_SIZE),
                                           CGAffineTransformIdentity,
                                           2 * TILE_SIZE,
                                           2 * TILE_SIZE,
                                           kCGPatternTilingNoDistortion,
                                           true,
                                           &callback);
    
    CGFloat alpha=1;
    //注意最后一个参数对于有颜色瓷砖指定为透明度的参数地址，对于无颜色瓷砖则指定当前颜色空间对应的颜色数组
    CGContextSetFillPattern(context, pattern, &alpha);
    
    // 绘制大小
//    UIRectFill(CGRectMake(0, 0, 60, 60));
    UIRectFill(self.bounds);
    
    // 移除
    CGColorSpaceRelease(colorSpace);
    CGPatternRelease(pattern);
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawBackgoundWithColorPattern:ctx];
    
//    CGContextRef ref = UIGraphicsGetCurrentContext();
//    CGContextSetLineWidth(ref, 2);
//    [[UIColor orangeColor] set];
//    float xy = self.frame.size.width/2;
//    CGContextAddArc(ref, xy,xy,xy*0.99, 0, M_PI*1.8, 0);
//    CGContextStrokePath(ref);
    

}
@end
