//
//  GTCircleView.h
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/28.
//  Copyright © 2019年 imera. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTCircleView : UIView

@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign, readonly) CGFloat lineWidth;

- (instancetype)initWithFrame:(CGRect)frame
                   startAngle:(CGFloat)startAngle
                    strokeEnd:(CGFloat)strokeEnd
                    lineWidth:(CGFloat)lineWidth
                  isClockWise:(BOOL)isClockWise;

- (void)startAnimationWithStrokeEnd:(CGFloat)strokeEnd
                           duration:(CGFloat)duration
                     timingFunction:(CAMediaTimingFunctionName)timingFunction;

- (void)startAnimationWithStrokeStart:(CGFloat)strokeStart
                             duration:(CGFloat)duration
                       timingFunction:(CAMediaTimingFunctionName)timingFunction;

@end

NS_ASSUME_NONNULL_END
