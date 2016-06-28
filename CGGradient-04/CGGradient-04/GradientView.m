//
//  GradientView.m
//  CGGradient-04
//
//  Created by long on 6/27/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "GradientView.h"

@implementation GradientView

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect ctxRect = CGContextGetClipBoundingBox(ctx);
    CGRect clip = CGRectInset(ctxRect, 20.0, 20.0);
    CGContextClipToRect(ctx, clip);
    
    CGFloat  location[2] = {0.0, 1.0};
    CGFloat  components[8] = {1.0,0.5, 0.4, 1.0,  //start color
                            0.8,0.8,0.3,1.0};   // end color
    
    CGColorSpaceRef myColorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef myGradient = CGGradientCreateWithColorComponents(myColorSpace, components, location, sizeof(components)/components[0]);
    
    // 绘制轴渐变
    CGPoint myStartPoint = CGPointMake(CGRectGetMidX(clip), CGRectGetMidY(clip));
    CGPoint myEndPoint = CGPointMake(CGRectGetMidX(clip), CGRectGetMidY(clip));
    CGContextDrawLinearGradient(ctx, myGradient, myStartPoint, myEndPoint, 0);
    
//    UIGraphicsBeginImageContextWithOptions
        //绘制径向渐变
//        CGPoint myStartPoint2 = CGPointMake(50, 50);
//        CGPoint myEndPoint2 = CGPointMake(200, 200);
//        CGFloat myStartRadius = 20,
//        myEndRadius = 100;
//        CGContextDrawRadialGradient (ctx, myGradient, myStartPoint2,
//                                     myStartRadius, myEndPoint2, myEndRadius,
//                                     kCGGradientDrawsAfterEndLocation);
}

@end
