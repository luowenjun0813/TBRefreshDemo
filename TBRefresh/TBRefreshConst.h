//
//  TBRefreshConst.h
//  TBRefreshDemo
//
//  Created by TB-Mac-018 on 16/1/4.
//  Copyright © 2016年 TB-Mac-018. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <objc/message.h>

//弱引用
#define TBWeakSelf __weak typeof(self) weakSelf = self;

// 日志输出
#ifdef DEBUG
#define TBRefreshLog(...) NSLog(__VA_ARGS__)
#else
#define TBRefreshLog(...)
#endif

// RGB颜色
#define TBRefreshColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 文字颜色
#define TBRefreshLabelTextColor TBRefreshColor(90, 90, 90)

// 字体大小
#define TBRefreshLabelFont [UIFont boldSystemFontOfSize:14]

// 图片路径
#define TBRefreshSrcName(file) [@"TBRefresh.bundle" stringByAppendingPathComponent:file]
#define TBRefreshFrameworkSrcName(file) [@"Frameworks/TBRefresh.framework/TBRefresh.bundle" stringByAppendingPathComponent:file]

// 常量
UIKIT_EXTERN const CGFloat TBRefreshHeaderHeight;
UIKIT_EXTERN const CGFloat TBRefreshFooterHeight;
UIKIT_EXTERN const CGFloat TBRefreshFastAnimationDuration;
UIKIT_EXTERN const CGFloat TBRefreshSlowAnimationDuration;

UIKIT_EXTERN NSString *const TBRefreshKeyPathContentOffset;
UIKIT_EXTERN NSString *const TBRefreshKeyPathContentSize;
UIKIT_EXTERN NSString *const TBRefreshKeyPathContentInset;
UIKIT_EXTERN NSString *const TBRefreshKeyPathPanState;

UIKIT_EXTERN NSString *const TBRefreshHeaderLastUpdatedTimeKey;

UIKIT_EXTERN NSString *const TBRefreshHeaderNotRefreshText;
UIKIT_EXTERN NSString *const TBRefreshHeaderPullingText;
UIKIT_EXTERN NSString *const TBRefreshHeaderRefreshingText;

UIKIT_EXTERN NSString *const TBRefreshAutoFooterNotRefreshText;
UIKIT_EXTERN NSString *const TBRefreshAutoFooterRefreshingText;
UIKIT_EXTERN NSString *const TBRefreshAutoFooterNoMoreDataText;

UIKIT_EXTERN NSString *const TBRefreshBackFooterNotRefreshText;
UIKIT_EXTERN NSString *const TBRefreshBackFooterPullingText;
UIKIT_EXTERN NSString *const TBRefreshBackFooterRefreshingText;
UIKIT_EXTERN NSString *const TBRefreshBackFooterNoMoreDataText;