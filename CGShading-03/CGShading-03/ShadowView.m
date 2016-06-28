//
//  ShadowView.m
//  CGShading-03
//
//  Created by long on 6/27/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ShadowView.h"


void MyDrawWithShadows(CGContextRef myContext, float wd, float ht) {
    CGSize myShadowOffset = CGSizeMake(-15, 20);
    CGFloat myColorValues[] = {1, 0, 0, .6};
    CGColorRef myColor;
    CGColorSpaceRef myColorSpace;
    
    CGContextSaveGState(myContext);
    
    CGContextSetShadow(myContext, myShadowOffset, 5);
    CGContextSetRGBFillColor(myContext, 0, 1, 0, 1);
    CGContextFillRect(myContext, CGRectMake (wd/3 + 75, ht/2 , wd/4, ht/4));
    
    myColorSpace = CGColorSpaceCreateDeviceRGB();
    myColor = CGColorCreate(myColorSpace, myColorValues);
    CGContextSetShadowWithColor(myContext, myShadowOffset, 5, myColor);
    CGContextSetRGBFillColor(myContext, 0, 0, 1, 1);
    CGContextFillRect(myContext, CGRectMake(wd/3 - 75, ht/2 - 100, wd/4, ht/4));
    
    CGColorRelease(myColor);
    CGColorSpaceRelease(myColorSpace);
    
    CGContextRestoreGState(myContext);
}

@implementation ShadowView
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    MyDrawWithShadows(context, 300, 300);
}
@end
