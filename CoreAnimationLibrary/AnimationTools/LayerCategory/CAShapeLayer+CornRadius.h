//
//  CAShapeLayer+CornRadius.h
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/23.
//  Copyright © 2019年 imera. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAShapeLayer (CornRadius)

+ (CAShapeLayer *)circleLayerWithFrame:(CGRect)frame fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor;
+ (CAShapeLayer *)shapeLayerWithFrame:(CGRect)frame corners:(UIRectCorner)corners radius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
