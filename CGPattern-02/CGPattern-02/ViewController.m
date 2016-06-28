//
//  ViewController.m
//  CGPattern-02
//
//  Created by long on 6/27/16.
//  Copyright © 2016 long. All rights reserved.
//

#import "ViewController.h"
#import "PatterView.h"
#import "PatternView2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    PatterView *patterView = [[PatterView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
//    [self.view addSubview:patterView];

    PatternView2 *patterView2 = [[PatternView2 alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:patterView2];
    patterView2.backgroundColor = [UIColor whiteColor];
}



@end
