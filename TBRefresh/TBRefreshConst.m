//
//  TBRefreshConst.m
//  TBRefreshDemo
//
//  Created by TB-Mac-018 on 16/1/4.
//  Copyright © 2016年 TB-Mac-018. All rights reserved.
//

#import <UIKit/UIKit.h>

const CGFloat TBRefreshHeaderHeight = 54.0;
const CGFloat TBRefreshFooterHeight = 44.0;
const CGFloat TBRefreshFastAnimationDuration = 0.25;
const CGFloat TBRefreshSlowAnimationDuration = 0.4;

NSString *const TBRefreshKeyPathContentOffset = @"contentOffset";
NSString *const TBRefreshKeyPathContentInset = @"contentInset";
NSString *const TBRefreshKeyPathContentSize = @"contentSize";
NSString *const TBRefreshKeyPathPanState = @"state";

NSString *const TBRefreshHeaderLastUpdatedTimeKey = @"TBRefreshHeaderLastUpdatedTimeKey";

NSString *const TBRefreshHeaderNotRefreshText = @"下拉刷新";
NSString *const TBRefreshHeaderPullingText = @"松开更新";
NSString *const TBRefreshHeaderRefreshingText = @"加载中";

NSString *const TBRefreshAutoFooterNotRefreshText = @"点击或上拉加载更多";
NSString *const TBRefreshAutoFooterRefreshingText = @"加载中";
NSString *const TBRefreshAutoFooterNoMoreDataText = @"没有更多数据了";

NSString *const TBRefreshBackFooterNotRefreshText = @"上拉刷新";
NSString *const TBRefreshBackFooterPullingText = @"松开更新";
NSString *const TBRefreshBackFooterRefreshingText = @"加载中";
NSString *const TBRefreshBackFooterNoMoreDataText = @"没有更多数据了";

