//
//  ViewController.m
//  CGShading-03
//
//  Created by long on 6/27/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ViewController.h"
#import "ShadowView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    ShadowView *shadowView = [[ShadowView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    shadowView.center = self.view.center;
    [self.view addSubview:shadowView];
}



@end
