//
//  UIScrollView+TBExtension.m
//  TBRefreshDemo
//
//  Created by TB-Mac-018 on 16/1/4.
//  Copyright © 2016年 TB-Mac-018. All rights reserved.
//

#import "UIScrollView+TBExtension.h"

@implementation UIScrollView (TBExtension)

- (void)setTb_insetT:(CGFloat)tb_insetT{
    UIEdgeInsets inset = self.contentInset;
    inset.top = tb_insetT;
    self.contentInset = inset;
}

-(CGFloat)tb_insetT{
    return self.contentInset.top;
}

- (void)setTb_insetB:(CGFloat)tb_insetB{
    UIEdgeInsets inset = self.contentInset;
    inset.bottom = tb_insetB;
    self.contentInset = inset;
}

-(CGFloat)tb_insetB{
    return self.contentInset.bottom;
}

- (void)setTb_insetL:(CGFloat)tb_insetL
{
    UIEdgeInsets inset = self.contentInset;
    inset.left = tb_insetL;
    self.contentInset = inset;
}

- (CGFloat)tb_insetL
{
    return self.contentInset.left;
}

- (void)setTb_insetR:(CGFloat)tb_insetR
{
    UIEdgeInsets inset = self.contentInset;
    inset.right = tb_insetR;
    self.contentInset = inset;
}

- (CGFloat)tb_insetR
{
    return self.contentInset.right;
}

- (void)setTb_offsetX:(CGFloat)tb_offsetX{
    CGPoint offset = self.contentOffset;
    offset.y = tb_offsetX;
    self.contentOffset = offset;
}

-(CGFloat)tb_offsetX{
    return self.contentOffset.y;
}

- (void)setTb_contentW:(CGFloat)tb_contentW
{
    CGSize size = self.contentSize;
    size.width = tb_contentW;
    self.contentSize = size;
}

- (CGFloat)tb_contentW
{
    return self.contentSize.width;
}

- (void)setTb_contentH:(CGFloat)tb_contentH
{
    CGSize size = self.contentSize;
    size.height = tb_contentH;
    self.contentSize = size;
}

- (CGFloat)tb_contentH
{
    return self.contentSize.height;
}
@end
