//
//  CustomSheetView.h
//  CustomSheet_Demo
//
//  Created by admin on 16/9/16.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:(a)]

#import <UIKit/UIKit.h>


typedef void(^CustomSheetViewSelectBlock)(NSInteger selectTag);
@interface CustomSheetView : UIView


-(instancetype)initWithFrame:(CGRect)frame leftTitleArr:(NSArray *)leftTitleArr rightImgsArr:(NSArray *)rightImgsArr;
-(void)show;


@property(copy,nonatomic)CustomSheetViewSelectBlock selectBlock;

@end
