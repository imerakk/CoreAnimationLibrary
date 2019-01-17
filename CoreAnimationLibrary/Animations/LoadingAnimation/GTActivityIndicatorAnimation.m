//
//  GTActivityIndicatorAnimation.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/16.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTActivityIndicatorAnimation.h"

@interface GTActivityIndicatorAnimation ()

@property (nonatomic, assign) GTActivityIndicatorAnimationType type;
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, strong) UIColor *tintColor;

@end

@implementation GTActivityIndicatorAnimation

+ (instancetype)animationWithType:(GTActivityIndicatorAnimationType)type {
    return [[self alloc] initWithType:type];
}

- (instancetype)initWithType:(GTActivityIndicatorAnimationType)type {
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (void)startAnimationInLayer:(CALayer *)layer withSize:(CGFloat)size tintColor:(nonnull UIColor *)tintColor {
    self.layer = layer;
    self.size = size;
    self.tintColor = tintColor;
    
    switch (self.type) {
        case GTActivityIndicatorAnimationTypeThreeDots:
            [self startAnimationForThreeDots];
            break;
    }
}

- (void)startAnimationForThreeDots {
    NSInteger count = 3;
    CGFloat circlePadding = 5.0;
    CGFloat circleSize = (self.size - circlePadding*2) / count;
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    CGFloat animationDuration = 0.7;

    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
    
    CATransform3D transform = CATransform3DMakeTranslation(circleSize + circlePadding, 0, 0);
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceCount = count;
    replicatorLayer.instanceDelay = animationDuration / (count*2);
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, self.size*0.5 - circleSize*0.5, circleSize, circleSize);
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.cornerRadius = circleSize / 2;
    layer.masksToBounds = YES;
    layer.backgroundColor = self.tintColor.CGColor;
    [replicatorLayer addSublayer:layer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.repeatCount = HUGE_VALF;
    animation.values = @[@(1.0), @(0.3), @(1.0)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    animation.keyTimes = @[@(0.0), @(0.3), @(1.0)];
    animation.duration = animationDuration;
    animation.removedOnCompletion = NO;
    [layer addAnimation:animation forKey:nil];
    
    [self.layer addSublayer:replicatorLayer];
}

@end
