//
//  GTActivityIndicatorView.h
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/16.
//  Copyright © 2019年 imera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTActivityIndicatorAnimation.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTActivityIndicatorView : UIView

@property (nonatomic, assign) BOOL isAnimating;

- (instancetype)initWithType:(GTActivityIndicatorAnimationType)type;
- (instancetype)initWithType:(GTActivityIndicatorAnimationType)type size:(CGFloat)size;
- (instancetype)initWithType:(GTActivityIndicatorAnimationType)type size:(CGFloat)size tintColor:(UIColor *)tintColor;

- (void)startAnimation;
- (void)pauseAnimation;
- (void)resumeAnimation;

@end

NS_ASSUME_NONNULL_END
