//
//  TBRefreshBase.m
//  TBRefreshDemo
//
//  Created by TB-Mac-018 on 16/1/5.
//  Copyright © 2016年 TB-Mac-018. All rights reserved.
//

#import "TBRefreshBase.h"

@interface TBRefreshBase()
/** 拖动手势 */
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;
@end

@implementation TBRefreshBase

#pragma mark - 初始化
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //属性设置
        [self prepare];
        //默认为不使用状态
        self.state = TBRefreshStateNotRefresh;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self autoLayoutSubviews];
}

/** 子类重写接口 */
- (void)prepare
{
    // 基本属性设置
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.backgroundColor = [UIColor clearColor];
}

/** 子类重写layoutSubviews接口 */
- (void) autoLayoutSubviews{

}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    // 如果不是UIScrollView，不做任何事情
    if (newSuperview && ![newSuperview isKindOfClass:[UIScrollView class]] ) return;
    
    // 旧的父控件移除监听
    [self removeObservers];
    
    if (newSuperview) {    //新的父类控件
        //设置宽度
        self.tb_w = newSuperview.tb_w;
        //设置位置
        self.tb_x = newSuperview.tb_x;
        
        //记录UIScrollView
        _scrollView = (UIScrollView *)newSuperview;
        // 设置永远支持垂直弹簧效果
        _scrollView.alwaysBounceVertical = YES;
        // 记录UIScrollView最开始的contentInset
        _scrollViewOriginalInset = _scrollView.contentInset;
        
        // 添加监听
        [self addObservers];
    }
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    if (self.state == TBRefreshStateWillRefresh) {
        // 预防view还没显示出来就调用了beginRefreshing
        self.state = TBRefreshStateRefreshing;
    }
}

#pragma mark - KVO监听
- (void)addObservers{
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:TBRefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:TBRefreshKeyPathContentSize options:options context:nil];
    self.panGesture = self.scrollView.panGestureRecognizer;
    [self.panGesture addObserver:self forKeyPath:TBRefreshKeyPathPanState options:options context:nil];
}

- (void)removeObservers{
    [self.superview removeObserver:self forKeyPath:TBRefreshKeyPathContentOffset];
    [self.superview removeObserver:self forKeyPath:TBRefreshKeyPathContentSize];
    [self.panGesture removeObserver:self forKeyPath:TBRefreshKeyPathContentOffset];
    self.panGesture = nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (!self.userInteractionEnabled) return;
    
    // 这个就算看不见也需要处理
    if ([keyPath isEqualToString:TBRefreshKeyPathContentSize]) {
        [self scrollViewContentSizeDidChange:change];
    }
    
    // 看不见
    if (self.hidden) return;
    if ([keyPath isEqualToString:TBRefreshKeyPathContentOffset]) {
        [self scrollViewContentOffsetDidChange:change];
    } else if ([keyPath isEqualToString:TBRefreshKeyPathPanState]) {
        [self scrollViewPanStateDidChange:change];
    }
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change{ }
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change{ }
- (void)scrollViewPanStateDidChange:(NSDictionary *)change{ }

#pragma mark - 公共方法

/** 执行刷新回调内部方法 */
- (void)executeRefreshingCallBack{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.refreshingBlock) {
            self.refreshingBlock();
        }
        if ([self.refreshingTarget respondsToSelector:self.refreshingAction]) {
            
        }
    });
}

/**
 *  设置回调对象和回调方法
 *
 *  @param target 回调对象
 *  @param action 回调方法
 */
- (void)setRefreshingTarget:(id)target refreshingAction:(SEL)action{
    self.refreshingTarget = target;
    self.refreshingAction = action;
}

/** 进入刷新状态*/
- (void)startRefreshing{
    [UIView animateWithDuration:TBRefreshFastAnimationDuration animations:^{
        self.alpha = 1.0;
    }];
    self.pullingPercent = 1.0;
    // 只要正在刷新，就完全显示
    if (self.window) {
        self.state = TBRefreshStateRefreshing;
    } else {
        self.state = TBRefreshStateRefreshing;
        // 刷新(预防从另一个控制器回到这个控制器的情况，回来要重新刷新一下)
        [self setNeedsDisplay];
    }
}

/** 结束刷新状态 */
- (void)finishRefreshing{
    self.state = TBRefreshStateNotRefresh;
}

/** 判断是否正在刷新 */
- (BOOL)isRefreshing{
    return self.state == TBRefreshStateRefreshing || self.state == TBRefreshStateWillRefresh;
}

/** 自动切换透明度 */
- (void)setAutomaticallyChangeAlpha:(BOOL)automaticallyChangeAlpha{
    
    self.automaticallyChangeAlpha = automaticallyChangeAlpha;
    
    if (self.isRefreshing) return;
    
    if (automaticallyChangeAlpha) {
        self.alpha = self.pullingPercent;
    } else {
        self.alpha = 1.0;
    }
}

/** 根据拖拽程度设置透明度 */
- (void)setPullingPercent:(CGFloat)pullingPercent{
    
    self.pullingPercent = pullingPercent;
    
    if (self.isRefreshing) return;
    
    if (self.isAutomaticallyChangeAlpha) {
        self.alpha = pullingPercent;
    }
}

@end

@implementation UILabel(TBRefresh)

+(instancetype)label{
    UILabel *label = [[self alloc] init];
    label.font = TBRefreshLabelFont;
    label.textColor = TBRefreshLabelTextColor;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    return label;
}

@end
