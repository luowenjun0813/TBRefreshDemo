//
//  UIScrollView+TBExtension.h
//  TBRefreshDemo
//
//  Created by TB-Mac-018 on 16/1/4.
//  Copyright © 2016年 TB-Mac-018. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (TBExtension)

@property (assign, nonatomic) CGFloat tb_insetT;
@property (assign, nonatomic) CGFloat tb_insetB;
@property (assign, nonatomic) CGFloat tb_insetL;
@property (assign, nonatomic) CGFloat tb_insetR;

@property (assign, nonatomic) CGFloat tb_offsetX;
@property (assign, nonatomic) CGFloat tb_offsetY;

@property (assign, nonatomic) CGFloat tb_contentW;
@property (assign, nonatomic) CGFloat tb_contentH;

@end
