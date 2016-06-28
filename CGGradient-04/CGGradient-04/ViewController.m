//
//  ViewController.m
//  CGGradient-04
//
//  Created by long on 6/27/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ViewController.h"
#import "GradientView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GradientView *gradientView = [[GradientView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    gradientView.center = self.view.center;
    gradientView.backgroundColor = [UIColor redColor];
    [self.view addSubview:gradientView];
}

@end
