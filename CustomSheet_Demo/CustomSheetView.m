
//
//  CustomSheetView.m
//  CustomSheet_Demo
//
//  Created by admin on 16/9/16.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "CustomSheetView.h"


@interface CustomSheetView ()
@property(strong,nonatomic)UIView *bgView;
@property(strong,nonatomic)UIView *bottomView;
@property(strong,nonatomic)UIButton *cancelBtn;


@property(strong,nonatomic)NSArray *leftTitleArr;
@property(strong,nonatomic)NSArray *rightImgsArr;


@end

@implementation CustomSheetView

-(instancetype)initWithFrame:(CGRect)frame leftTitleArr:(NSArray *)leftTitleArr rightImgsArr:(NSArray *)rightImgsArr;
{
    if (self=[super initWithFrame:frame]) {
        self.leftTitleArr = leftTitleArr;
        self.rightImgsArr = rightImgsArr;
        [self initUI];
    }
    return self;
}
-(void)initUI
{
    //自身背景
    self.frame =CGRectMake(0, 0, kScreenWidth,kScreenHeight);
    self.backgroundColor = [UIColor clearColor];
    
    //灰色背景
    _bgView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _bgView.backgroundColor =HexRGB(0x727272);
    [self addSubview:_bgView];
    
    //底部圆角的view
    _bottomView =[[UIView alloc]initWithFrame:CGRectMake(5, kScreenHeight-51*(self.leftTitleArr.count)-80, kScreenWidth-10, 50*(self.leftTitleArr.count))];
    _bottomView.backgroundColor =[UIColor whiteColor];
    _bottomView.layer.masksToBounds = YES;
    _bottomView.layer.cornerRadius = 10;
    [_bgView addSubview:_bottomView];
    
    
    for (NSInteger i=0; i<self.leftTitleArr.count; i++) {
        //左侧按钮
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(10, 51*i, kScreenWidth-20-60, 50);
        leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [leftBtn setTitle:self.leftTitleArr[i] forState:UIControlStateNormal];
        leftBtn.tag = 100+i;
        leftBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [leftBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [leftBtn setBackgroundColor:[UIColor whiteColor]];
        [_bottomView addSubview:leftBtn];
        
        //中间细线
        UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, leftBtn.frame.origin.y+leftBtn.frame.size.height, _bottomView.frame.size.width, 1)];
        lineLabel.backgroundColor = HexRGB(0xdedede);
        [_bottomView addSubview:lineLabel];
        
        //右侧图片
        UIImageView *rightImgView =[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-10-40, 51*i+10, 30, 30)];
        rightImgView.image =[UIImage imageNamed:self.rightImgsArr[i]];
        rightImgView.userInteractionEnabled = YES;
        [_bottomView addSubview:rightImgView];
    }
    
    //取消按钮
    _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _cancelBtn.frame = CGRectMake(5, kScreenHeight-70, kScreenWidth-10, 50);
    [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
    _cancelBtn.layer.masksToBounds = YES;
    _cancelBtn.layer.cornerRadius = 10;
    [_cancelBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_cancelBtn setBackgroundColor:[UIColor whiteColor]];
    [_bgView addSubview:_cancelBtn];
    
    
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    [self addGestureRecognizer:tap];
}
-(void)btnAction:(UIButton *)leftBtnAction
{
    [self dismiss];
    self.selectBlock(leftBtnAction.tag);
}
-(void)cancelAction
{
    [self dismiss];
}

-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
}

-(void)dismiss{
    [self removeFromSuperview];
    
}
@end
