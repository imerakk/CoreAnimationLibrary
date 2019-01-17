//
//  UIView+Animation.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/14.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "UIView+Animation.h"
#import "CALayer+Animation.h"

static const CGFloat kTransformM34 = -1 / 500.0;

static CABasicAnimation * GTRotateAnimation(CATransform3D formTransform, CATransform3D toTransform, NSTimeInterval duration) {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform";
    animation.fromValue = [NSValue valueWithCATransform3D:formTransform];
    animation.toValue = [NSValue valueWithCATransform3D:toTransform];
    animation.duration = duration;
    return animation;
}

@implementation UIView (Animation)

@end

@implementation UIView (OverTurn)

- (void)overTurnAnimationWithFromRadians:(CGFloat)fromRadians
                               toRadians:(CGFloat)toRadians
                                duration:(NSTimeInterval)duration
                             orientation:(GTOrientation)orientation
                              completion:(void (^)(BOOL))completion {
    
    CATransform3D (^transformFactory)(CGFloat) = ^ (CGFloat radians) {
        CATransform3D transform = CATransform3DIdentity;
        transform.m34 = kTransformM34;
        if (orientation == GTOrientationHorizontal) {
            transform =  CATransform3DRotate(transform, radians, 0, 1, 0);
        }
        else {
            transform =  CATransform3DRotate(transform, radians, 1, 0, 0);
        }
        
        return transform;
    };
    
    CABasicAnimation *animation = GTRotateAnimation(transformFactory(fromRadians), transformFactory(toRadians), duration);
    [self.layer startAnimation:animation completion:completion];
}

- (void)cardOverTurnAnimationWithFront:(UIView *)front
                                  back:(UIView *)back
                              duration:(NSTimeInterval)duration
                           orientation:(GTOrientation)orientation
                           isClockwise:(BOOL)isClockwise
                            completion:(void (^)(BOOL))completion {
    NSAssert(front.superview == back.superview, @"front and back must be subview of self");
    
    CGFloat radians = isClockwise ? M_PI_2 : -M_PI_2;
    
    front.layer.doubleSided = NO;
    back.layer.doubleSided = NO;
    front.hidden = NO;
    back.hidden = YES;
    
    self.userInteractionEnabled = NO;
    __weak typeof(self) weakSelf = self;
    [front overTurnAnimationWithFromRadians:0 toRadians:radians duration:duration / 2 orientation:orientation completion:^(BOOL success) {
        front.hidden = YES;
        back.hidden = NO;
        [back overTurnAnimationWithFromRadians:-radians toRadians:0 duration:duration / 2 orientation:orientation completion:^(BOOL success) {
            if (completion) {
                completion(success);
            }
            weakSelf.userInteractionEnabled = YES;
        }];
    }];
}


@end
