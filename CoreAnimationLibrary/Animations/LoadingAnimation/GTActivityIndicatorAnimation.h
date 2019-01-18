//
//  GTActivityIndicatorAnimation.h
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/16.
//  Copyright © 2019年 imera. All rights reserved.
//

#import <UIKit/UIKit.h>

//form https://connoratherton.com/loaders

typedef NS_ENUM(NSInteger, GTActivityIndicatorAnimationType) {
    GTActivityIndicatorAnimationTypeThreeDots,
    GTActivityIndicatorAnimationTypeBallBounces,
    GTActivityIndicatorAnimationTypeBallRotation,
    GTActivityIndicatorAnimationTypeBallTrianglePath,
    GTActivityIndicatorAnimationTypeBallGridPulse,
    GTActivityIndicatorAnimationTypeBallRound,
    GTActivityIndicatorAnimationTypeBallRoundDouble,
    GTActivityIndicatorAnimationTypeBallRoundThree
};

NS_ASSUME_NONNULL_BEGIN

@interface GTActivityIndicatorAnimation : NSObject

+ (instancetype)animationWithType:(GTActivityIndicatorAnimationType)type;
- (void)startAnimationInLayer:(CALayer *)layer withSize:(CGFloat)size tintColor:(UIColor *)tintColor;

@end

NS_ASSUME_NONNULL_END
