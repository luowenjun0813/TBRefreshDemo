//
//  TBRefreshBase.h
//  TBRefreshDemo
//
//  Created by TB-Mac-018 on 16/1/5.
//  Copyright © 2016年 TB-Mac-018. All rights reserved.
//  刷新控件的基类

#import <UIKit/UIKit.h>
#import "UIScrollView+TBExtension.h"
#import "UIScrollView+TBRefresh.h"
#import "UIView+TBExtension.h"
#import "TBRefreshConst.h"

/** 刷新控件的状态 */
typedef NS_ENUM(NSInteger, TBRefreshState) {
    /** 不使用状态 */
    TBRefreshStateNotRefresh = 0,
    /** 松开就可以进行刷新的状态 */
    TBRefreshStatePulling,
    /** 正在刷新中的状态 */
    TBRefreshStateRefreshing,
    /** 即将刷新的状态 */
    TBRefreshStateWillRefresh,
    /** 所有数据加载完毕，没有更多的数据了 */
    TBRefreshStateNoMoreData
};

/** 进入刷新状态的回调 */
typedef void (^TBRefreshBaseRefreshingBlock)();

/** 刷新控件的基类 */
@interface TBRefreshBase : UIView
{
    /** 记录scrollView原始的inset */
    UIEdgeInsets _scrollViewOriginalInset;
    /** 父控件 */
    __weak UIScrollView *_scrollView;
}

#pragma mark - 刷新回调
/** 正在刷新的回调 */
@property (nonatomic, copy) TBRefreshBaseRefreshingBlock refreshingBlock;
/** 设置回调对象和回调方法 */
- (void)setRefreshingTarget:(id)target refreshingAction:(SEL)action;
/** 回调对象 */
@property (nonatomic, weak) id refreshingTarget;
/** 回调方法 */
@property (nonatomic, assign) SEL refreshingAction;
/** 触发回调 */
- (void)executeRefreshingCallBack;

#pragma mark - 刷新状态控制
/** 进入刷新状态 */
- (void)startRefreshing;
/** 结束刷新状态 */
- (void)finishRefreshing;
/** 判断是否正在刷新 */
- (BOOL)isRefreshing;
/** 刷新状态 在子类内部实现 */
@property (assign, nonatomic) TBRefreshState state;

#pragma mark - 子类访问的属性
/** 记录scrollView原始的inset */
@property (nonatomic, assign, readonly) UIEdgeInsets _scrollViewOriginalInset;
/** 父控件 */
@property (weak, nonatomic, readonly) UIScrollView *scrollView;

#pragma mark - 子类必现的方法
/** 初始化接口 */
- (void)prepare NS_REQUIRES_SUPER;
/** 子类重写layoutSubviews接口 */
- (void)autoLayoutSubviews NS_REQUIRES_SUPER;
/** 当scrollView的contentOffset发生改变的时候调用 */
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
/** 当scrollView的contentSize发生改变的时候调用 */
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
/** 当scrollView的拖拽状态发生改变的时候调用 */
- (void)scrollViewPanStateDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;

#pragma mark - Others
/** 拉拽的百分比（子类重写） */
@property (nonatomic, assign) CGFloat pullingPercent;
/** 根据拉拽比列自动切换透明度 */
@property (nonatomic, assign, getter=isAutomaticallyChangeAlpha) BOOL automaticallyChangeAlpha;

@end

@interface UILabel(TBRefresh)
+ (instancetype)label;
@end
