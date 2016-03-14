//
//  UIView+TBExtension.m
//  TBRefreshDemo
//
//  Created by TB-Mac-018 on 16/1/4.
//  Copyright © 2016年 TB-Mac-018. All rights reserved.
//

#import "UIView+TBExtension.h"

@implementation UIView (TBExtension)

- (void)setTb_x:(CGFloat)tb_x{
    CGRect frame = self.frame;
    frame.origin.x = tb_x;
    self.frame = frame;
}

- (CGFloat)tb_x{
    return self.frame.origin.x;
}

- (void)setTb_y:(CGFloat)tb_y{
    CGRect frame = self.frame;
    frame.origin.y = tb_y;
    self.frame = frame;
}

- (CGFloat)tb_y{
    return self.frame.origin.y;
}

- (void)setTb_w:(CGFloat)tb_w{
    CGRect frame = self.frame;
    frame.size.width = tb_w;
    self.frame = frame;
}

- (CGFloat)tb_w{
    return self.frame.size.width;
}

- (void)setTb_h:(CGFloat)tb_h
{
    CGRect frame = self.frame;
    frame.size.height = tb_h;
    self.frame = frame;
}

- (CGFloat)tb_h
{
    return self.frame.size.height;
}

- (void)setTb_size:(CGSize)tb_size{
    CGRect frame = self.frame;
    frame.size = tb_size;
    self.frame = frame;
}

- (CGSize)tb_size{
    return self.frame.size;
}

- (void)setTb_origin:(CGPoint)tb_origin{
    CGRect frame = self.frame;
    frame.origin = tb_origin;
    self.frame = frame;
}

-(CGPoint)tb_origin{
    return self.frame.origin;
}
@end
