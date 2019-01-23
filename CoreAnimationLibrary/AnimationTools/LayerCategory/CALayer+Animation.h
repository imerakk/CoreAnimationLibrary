//
//  CALayer+Animation.h
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/17.
//  Copyright © 2019年 imera. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>


NS_ASSUME_NONNULL_BEGIN

@interface CALayer (Animation)

- (void)startAnimation:(CAAnimation *)animation completion:(void (^)(BOOL))completion;
- (void)pauseAnimations;
- (void)resumeAnimations;

@end

NS_ASSUME_NONNULL_END
