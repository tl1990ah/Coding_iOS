//
//  TLProjectViewController.m
//  Coding_iOS
//
//  Created by taolei-mac on 2017/11/22.
//  Copyright © 2017年 com.lianchuan. All rights reserved.
//

#import "TLProjectViewController.h"

@interface TLProjectViewController ()

@end

@implementation TLProjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"项目";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    TLBaseViewController *destVc = [[TLBaseViewController alloc] init];
    destVc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:destVc animated:YES];
}

@end
