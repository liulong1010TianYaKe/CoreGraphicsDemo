//
//  ViewController.m
//  CoreGraphics-01
//
//  Created by long on 6/24/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ViewController.h"
#import <CoreGraphics/CoreGraphics.h>
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIGraphicsBeginImageContextWithOptions
//    UIColor
//    CGPathRef
//   CGImageRef
//    CGImageS
//    UIGraphicsGetCurrentContext()
//    CGContextSetShouldAntialias
    CustomView *customView = [[CustomView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:customView];
    
//    CGContextRef
//    CGBitmapContextCreate
    size_t componets =  CGColorGetNumberOfComponents([UIColor redColor].CGColor);
    CGColorSpaceCreateLab
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
