//
//  GTActivityIndicatorView.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/16.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTActivityIndicatorView.h"
#import "UIView+GTLayout.h"
#import "CALayer+Animation.h"

static const CGFloat kActivityIndicatorSize = 40;

@interface GTActivityIndicatorView ()

@property (nonatomic, assign) GTActivityIndicatorAnimationType animationType;
@property (nonatomic, assign) CGFloat indicatorSize;
@property (nonatomic, assign) UIColor *tintColor;

@end

@implementation GTActivityIndicatorView

- (instancetype)initWithType:(GTActivityIndicatorAnimationType)type {
    return [self initWithType:type size:kActivityIndicatorSize];
}

- (instancetype)initWithType:(GTActivityIndicatorAnimationType)type size:(CGFloat)size {
    return [self initWithType:type size:size tintColor:[UIColor whiteColor]];
}

- (instancetype)initWithType:(GTActivityIndicatorAnimationType)type size:(CGFloat)size tintColor:(nonnull UIColor *)tintColor {
    self = [super init];
    if (self) {
        self.size = CGSizeMake(size, size);

        _isAnimating = NO;
        _animationType = type;
        _indicatorSize = size;
        _tintColor = tintColor;
    }
    
    return self;
}

- (void)startAnimation {
    GTActivityIndicatorAnimation *animation = [GTActivityIndicatorAnimation animationWithType:_animationType];
    [animation startAnimationInLayer:self.layer withSize:self.indicatorSize tintColor:self.tintColor];
    self.isAnimating = YES;
}

- (void)pauseAnimation {
    [self.layer pauseAnimations];
    self.isAnimating = NO;
}

- (void)resumeAnimation {
    [self.layer resumeAnimations];
    self.isAnimating = YES;
}

@end
