//
//  CALayer+Animation.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/17.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "CALayer+Animation.h"

@interface _GTAnimationDelegate : NSObject <CAAnimationDelegate>

@property (nonatomic, copy) void (^block)(BOOL);

- (instancetype)initWithBlock:(void (^)(BOOL))block;

@end

@implementation _GTAnimationDelegate

- (instancetype)initWithBlock:(void (^)(BOOL))block {
    self = [super init];
    if (self) {
        self.block = block;
    }
    return self;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.block) {
        self.block(flag);
    }
}

@end

///////////////////////////////////////////////////////////////////////////////////////
@implementation CALayer (Animation)

- (void)startAnimation:(CAAnimation *)animation completion:(void (^)(BOOL success))completion {
    _GTAnimationDelegate *animationDelegate = [[_GTAnimationDelegate alloc] initWithBlock:completion];
    animation.delegate = animationDelegate;
    [self addAnimation:animation forKey:nil];
}

- (void)pauseAnimations {
    CFTimeInterval pauseTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.timeOffset = pauseTime;
    self.speed = 0.0;
}

- (void)resumeAnimations {
    CFTimeInterval pauseTime = self.timeOffset;
    
    self.timeOffset = 0;
    self.speed = 1.0;
    
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() fromLayer:nil] - pauseTime;
    self.timeOffset = -timeSincePause;
}

@end
