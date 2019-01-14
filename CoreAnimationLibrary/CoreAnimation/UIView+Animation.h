//
//  UIView+Animation.h
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/14.
//  Copyright © 2019年 imera. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, GTOrientation) {
    GTOrientationHorizontal,
    GTOrientationVeritcal
};

@interface UIView (Animation)

- (void)startAnimation:(CAAnimation *)animation completion:(void (^)(BOOL))completion;

@end


@interface UIView (OverTurn)

/**
 翻转动画

 @param fromRadians 起始弧度
 @param toRadians 终止弧度
 @param duration 持续时间
 @param orientation 翻转方向
 @param completion 动画完成
 */
- (void)overTurnAnimationWithFromRadians:(CGFloat)fromRadians
                               toRadians:(CGFloat)toRadians
                                duration:(NSTimeInterval)duration
                             orientation:(GTOrientation)orientation
                              completion:(void (^)(BOOL))completion;


/**
 卡牌翻转效果
 
 @param front 正面
 @param back 背面
 @param duration 持续时间
 @param orientation 翻转方向
 @param isClockwise 是否顺时针翻转
 @param completion 动画完成
 */
- (void)cardOverTurnAnimationWithFront:(UIView *)front
                                  back:(UIView *)back
                              duration:(NSTimeInterval)duration
                           orientation:(GTOrientation)orientation
                           isClockwise:(BOOL)isClockwise
                            completion:(void (^)(BOOL))completion;


@end

NS_ASSUME_NONNULL_END
