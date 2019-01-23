//
//  GTTimingFunctionCurveGraphView.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/21.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTTimingFunctionCurveGraphView.h"

@implementation GTTimingFunctionCurveGraphView

- (instancetype)initWithFrame:(CGRect)frame
                 functionName:(CAMediaTimingFunctionName)functionName
                  strokeColor:(nonnull UIColor *)strokeColor {
    CAMediaTimingFunction *function = [CAMediaTimingFunction functionWithName:functionName];

    float cp1[2],cp2[2];
    [function getControlPointAtIndex:1 values:cp1];
    [function getControlPointAtIndex:2 values:cp2];
    
    return [self initWithFrame:frame controlPoint1:CGPointMake(cp1[0], cp1[1]) controlPoint2:CGPointMake(cp2[0], cp2[1]) strokeColor:strokeColor];
}

- (instancetype)initWithFrame:(CGRect)frame
                controlPoint1:(CGPoint)controlPoint1
                controlPoint2:(CGPoint)controlPoint2
                  strokeColor:(UIColor *)strokeColor  {
    self = [super initWithFrame:frame];
    if (self) {
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        UIBezierPath *path = [[UIBezierPath alloc] init];
        [path moveToPoint:CGPointZero];
        [path addCurveToPoint:CGPointMake(1, 1)
                controlPoint1:controlPoint1 controlPoint2:controlPoint2];
        [path applyTransform:CGAffineTransformMakeScale(frame.size.width, frame.size.width)];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = strokeColor.CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        self.layer.geometryFlipped = YES;
        [self.layer addSublayer:shapeLayer];
    }
    
    return self;
}

@end
