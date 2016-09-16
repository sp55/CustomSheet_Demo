//
//  ViewController.m
//  CustomSheet_Demo
//
//  Created by admin on 16/9/16.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "CustomSheetView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    CustomSheetView *customView = [[CustomSheetView alloc] initWithFrame:self.view.bounds leftTitleArr:@[@"添加",@"图"] rightImgsArr:@[@"add",@"tu"]];
    [customView show];
    
    customView.selectBlock = ^(NSInteger selectTag){
        NSLog(@"--------->%zd",selectTag);
    };
}

@end
