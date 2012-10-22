//
//  ZSViewController.m
//  CoreTextLayoutExample
//
//  Created by Zac Siegel on 10/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ZSViewController.h"
#import "ZSTextLayoutView.h"

@interface ZSViewController ()

@end

@implementation ZSViewController

- (void)loadView {
    [super loadView];
    self.view = [[ZSTextLayoutView alloc] init];
    self.view.frame = [[UIScreen mainScreen] bounds];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end