//
//  CustomView.m
//  CoreGraphics-01
//
//  Created by long on 6/24/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "CustomView.h"


 void MyDrawColoredPattern(void *info, CGContextRef mycontext){
    CGFloat subunit = 5;
    
     CGSize size = {subunit, subunit};
     CGPoint point1 = {0,0}, point2 = {subunit, subunit}, point3 = {0,subunit}, point4 = {subunit,0};
     CGRect myRect1 = {point1,size}, myRect2 = {point2, size}, myRect3 = {point3,size}, myRect4 = {point4,size};
     
     CGContextSetRGBFillColor(mycontext, 0, 0, 1, 0.5);
     CGContextFillRect(mycontext, myRect1);
     CGContextSetRGBFillColor(mycontext, 1, 0, 0, 0.5);
     CGContextFillRect(mycontext, myRect2);
     CGContextSetRGBFillColor(mycontext, 0, 1, 0, 0.5);
     CGContextFillRect(mycontext, myRect3);
     CGContextSetRGBFillColor(mycontext, .5, 0, .5, 0.5);
     CGContextFillRect(mycontext, myRect4);
}
@interface CustomView ()

@end


@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    /*
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, 200, 200, 100, 0, M_PI * 2.0, 0);
    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1.0);
    CGContextSetShadow(ctx, CGSizeMake(10, 10), 0.6);
    CGContextSetLineWidth(ctx, 10);
    CGContextStrokePath(ctx);*/
    

    /*
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef pathRef = CGPathCreateMutable();
    CGContextBeginPath(ctx);
    CGPathAddArc(pathRef, nil, 200, 200, 100, 0, 2.0*M_PI, YES);
    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1);
//    CGContextSetRGBFillColor(ctx, 0.3, 0.4, 0.5, 1);
    CGContextSetLineWidth(ctx, 10);
//    CGContextStrokePath(ctx);
    CGContextDrawPath(ctx, kCGPathStroke);
//    CGContextFillPath(ctx);
    
//    CGPathRelease(pathRef);
     */
    
    
    /*
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 200)];;
    [[UIColor colorWithRed:0.5 green:0.5 blue:0.9 alpha:1] setStroke];
    path.lineWidth = 10;
    [path stroke];*/
    
    /*
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 200, 200);
    
    CGPoint point2 = CGPointMake(200, 200);
    CGPoint point3 = CGPointMake(200, 400);
    CGPoint point4 = CGPointMake(0, 200);
    CGPoint points[3] = {point2, point3, point4};
    CGContextAddLines(ctx, points, 3); // reset start point
    
    CGContextAddArc(ctx, 200, 200, 100, 0, M_PI_2, 0);
    CGContextAddArcToPoint(ctx, 200, 400, 400, 400, 100);
    
    CGContextAddCurveToPoint(ctx, 100, 400, 200, 300, 100, 200);
    CGContextAddQuadCurveToPoint(ctx, 0, 100, 200, 100);
    
    CGContextClosePath(ctx);
    
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 200));
    CGContextAddRect(ctx, CGRectMake(200, 400, 100, 200));
    

    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.9, 1);
    CGContextSetLineWidth(ctx, 5);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    CGContextDrawPath(ctx, kCGPathStroke); */
    
    /*
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextFillRect(ctx, CGRectMake(100, 100, 100, 200));
    CGRect rects[2] = {CGRectMake(100, 100, 100, 200), CGRectMake(200, 300, 100, 200)};
    CGContextSetRGBFillColor(ctx, 0.5, 0.7, 0.8, 1);
    CGContextFillRects(ctx, rects, 2);
    CGContextFillEllipseInRect(ctx, CGRectMake(100, 100, 100, 200));
     */
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(context, self.bounds);
    CGColorSpaceRef patternSpace = CGColorSpaceCreatePattern(NULL);
    CGContextSetFillColorSpace(context, patternSpace);
    CGColorSpaceRelease(patternSpace);
    
    static const CGPatternCallbacks callBack = {0, &MyDrawColoredPattern, NULL};
    CGPatternRef patterRef = CGPatternCreate(NULL, CGRectMake(0, 0, 16, 16), CGAffineTransformIdentity, 12, 12, kCGPatternTilingNoDistortion, true, &callBack);
    CGFloat alpha = 1.0;
    CGContextSetFillPattern(context, patterRef, &alpha);
    CGPatternRelease(patterRef);
    
    CGContextDrawPath(context, kCGPathFill);
}



@end
