//
//  GTTimingFunctionCurveGraphView.h
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/21.
//  Copyright © 2019年 imera. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTTimingFunctionCurveGraphView : UIView

- (instancetype)initWithFrame:(CGRect)frame
                 functionName:(CAMediaTimingFunctionName)functionName
                  strokeColor:(UIColor *)strokeColor;

- (instancetype)initWithFrame:(CGRect)frame
                controlPoint1:(CGPoint)controlPoint1
                controlPoint2:(CGPoint)controlPoint2
                  strokeColor:(UIColor *)strokeColor;

@end

NS_ASSUME_NONNULL_END
