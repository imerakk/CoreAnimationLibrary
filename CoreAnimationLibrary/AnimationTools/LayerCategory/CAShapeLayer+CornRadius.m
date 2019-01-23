//
//  CAShapeLayer+CornRadius.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/23.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "CAShapeLayer+CornRadius.h"

@implementation CAShapeLayer (CornRadius)

+ (CAShapeLayer *)circleLayerWithFrame:(CGRect)frame fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = frame;
    
    CGPoint center = CGPointMake(frame.size.width * 0.5, frame.size.height*0.5);
    CGFloat radius = frame.size.width * 0.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI*2 clockwise:YES];
    layer.path = path.CGPath;
    layer.strokeColor = strokeColor.CGColor;
    layer.fillColor = fillColor.CGColor;
    return layer;
}

+ (CAShapeLayer *)shapeLayerWithFrame:(CGRect)frame corners:(UIRectCorner)corners radius:(CGFloat)radius {
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = frame;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, frame.size.width, frame.size.height) byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    layer.path = path.CGPath;
    return layer;
}

@end
