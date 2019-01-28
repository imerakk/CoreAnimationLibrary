//
//  GTCircleView.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/28.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTCircleView.h"
#import "GTAnimationKeyPath.h"
#import "CALayer+Animation.h"

@implementation GTCircleView

+ (Class)layerClass {
    return [CAShapeLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
                   startAngle:(CGFloat)startAngle
                    strokeEnd:(CGFloat)strokeEnd
                    lineWidth:(CGFloat)lineWidth
                  isClockWise:(BOOL)isClockWise {
    self = [super initWithFrame:frame];
    if (self) {
        _lineWidth = lineWidth;
        _strokeColor = [UIColor blackColor];
        
        CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
        shapeLayer.lineWidth = _lineWidth;
        shapeLayer.strokeColor = _strokeColor.CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        CGFloat endAngle = 0.0;
        if (isClockWise) {
            endAngle = startAngle + M_PI*2;
        }
        else {
            endAngle = startAngle - M_PI*2;
        }
        CGFloat radius = frame.size.width*0.5 - lineWidth*0.5;
        
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(frame.size.width*0.5, frame.size.height*0.5) radius:radius startAngle:startAngle endAngle:endAngle clockwise:isClockWise];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeEnd = strokeEnd;
    }
    
    return self;
}

- (void)startAnimationWithStrokeEnd:(CGFloat)strokeEnd
                           duration:(CGFloat)duration
                     timingFunction:(CAMediaTimingFunctionName)timingFunction {
    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = kCAAnimationKeyPathStrokeEnd;
    animation.duration = duration;
    animation.fromValue = @(shapeLayer.strokeEnd);
    animation.toValue = @(strokeEnd);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
    [self.layer addAnimation:animation forKey:nil];
    
    shapeLayer.strokeEnd = strokeEnd;
}

- (void)startAnimationWithStrokeStart:(CGFloat)strokeStart
                             duration:(CGFloat)duration
                       timingFunction:(CAMediaTimingFunctionName)timingFunction {
    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;

    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = kCAAnimationKeyPathStrokeStart;
    animation.duration = duration;
    animation.fromValue = @(shapeLayer.strokeStart);
    animation.toValue = @(strokeStart);
    animation.timingFunction = [CAMediaTimingFunction functionWithName:timingFunction];
    [self.layer addAnimation:animation forKey:nil];
    
    shapeLayer.strokeStart = strokeStart;
}

- (void)setStrokeColor:(UIColor *)strokeColor {
    _strokeColor = strokeColor;
    
    CAShapeLayer *shapeLayer = (CAShapeLayer *)self.layer;
    shapeLayer.strokeColor = strokeColor.CGColor;
}

@end
