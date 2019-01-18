//
//  GTActivityIndicatorAnimation.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/16.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTActivityIndicatorAnimation.h"
#import "CALayer+Animation.h"
#import <math.h>

#define TIMING_FUNCTION(name) ([CAMediaTimingFunction functionWithName:name])

@interface GTActivityIndicatorAnimation ()

@property (nonatomic, assign) GTActivityIndicatorAnimationType type;
@property (nonatomic, strong) CALayer *layer;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, strong) UIColor *tintColor;

@end

@implementation GTActivityIndicatorAnimation

+ (instancetype)animationWithType:(GTActivityIndicatorAnimationType)type {
    return [[self alloc] initWithType:type];
}

- (instancetype)initWithType:(GTActivityIndicatorAnimationType)type {
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (void)startAnimationInLayer:(CALayer *)layer withSize:(CGFloat)size tintColor:(nonnull UIColor *)tintColor {
    self.layer = layer;
    self.size = size;
    self.tintColor = tintColor;
    
    switch (self.type) {
        case GTActivityIndicatorAnimationTypeThreeDots:
            [self startAnimationForThreeDots];
            break;
            
        case GTActivityIndicatorAnimationTypeBallBounces:
            [self startAnimationForBallBounces];
            break;
            
        case GTActivityIndicatorAnimationTypeBallRotation:
            [self startAnimationForBallRotation];
            break;
            
        case GTActivityIndicatorAnimationTypeBallTrianglePath:
            [self startAnimationForBallTrianglePath];
            break;
            
        case GTActivityIndicatorAnimationTypeBallGridPulse:
            [self startAnimationForBallGridPulse];
            break;
            
        case GTActivityIndicatorAnimationTypeBallRound:
            [self startAnimationForBallRound];
            break;
            
        case GTActivityIndicatorAnimationTypeBallRoundDouble:
            [self startAnimationForBallRoundDouble];
            break;
            
        case GTActivityIndicatorAnimationTypeBallRoundThree:
            [self startAnimationForBallRoundThree];
            break;
    }
}

- (CAShapeLayer *)createCircleWithFrame:(CGRect)frame fillColor:(UIColor *)fillColor strokeColor:(UIColor *)strokeColor {
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

- (void)startAnimationForThreeDots {
    NSInteger count = 3;
    CGFloat circlePadding = 6.0;
    CGFloat circleSize = (self.size - circlePadding*2) / count;
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    CGFloat animationDuration = 0.75;

    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
    [self.layer addSublayer:replicatorLayer];
    
    CATransform3D transform = CATransform3DMakeTranslation(circleSize + circlePadding, 0, 0);
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceCount = count;
    replicatorLayer.instanceDelay = animationDuration / (count*2);
    
    CAShapeLayer *layer = [self createCircleWithFrame:CGRectMake(0, self.size*0.5 - circleSize*0.5, circleSize, circleSize)
                                            fillColor:self.tintColor
                                          strokeColor:self.tintColor];
    [replicatorLayer addSublayer:layer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = kCAAnimationKeyPathScale;
    animation.repeatCount = HUGE_VALF;
    animation.values = @[@1.0, @0.3, @1.0];
    animation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseIn),TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut)];
    animation.keyTimes = @[@0.0, @0.3, @1.0];
    animation.duration = animationDuration;
    animation.removedOnCompletion = NO;
    [layer addAnimation:animation forKey:nil];
}

- (void)startAnimationForBallBounces {
    NSInteger count = 3;
    CGFloat circlePadding = 6.0;
    CGFloat circleSize = (self.size - circlePadding*2) / count;
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    CGFloat animationDuration = 0.5;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
    [self.layer addSublayer:replicatorLayer];
    
    CATransform3D transform = CATransform3DMakeTranslation(circleSize + circlePadding, 0, 0);
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceCount = count;
    replicatorLayer.instanceDelay = animationDuration / (count*2);
    
    CAShapeLayer *layer = [self createCircleWithFrame:CGRectMake(0, self.size*0.5 - circleSize*0.5, circleSize, circleSize)
                                            fillColor:self.tintColor
                                          strokeColor:self.tintColor];
    [replicatorLayer addSublayer:layer];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = kCAAnimationKeyPathPositionY;
    animation.repeatCount = HUGE_VALF;
    animation.values = @[@(layer.position.y), @(layer.position.y - circleSize), @(layer.position.y)];
    animation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut),TIMING_FUNCTION(kCAMediaTimingFunctionEaseIn)];
    animation.keyTimes = @[@0.0, @0.5, @1.0];
    animation.duration = animationDuration;
    animation.removedOnCompletion = NO;
    [layer addAnimation:animation forKey:nil];
}

- (void)startAnimationForBallRotation {
    NSInteger count = 3;
    CGFloat circlePadding = 10.0;
    CGFloat circleSize = (self.size - circlePadding*2) / count;
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    CGFloat animationDuration = 1;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
    [self.layer addSublayer:replicatorLayer];
    
    CATransform3D transform = CATransform3DMakeTranslation(circleSize + circlePadding, 0, 0);
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceCount = count;
    replicatorLayer.instanceDelay = animationDuration / (count*2);
    
    CAShapeLayer *layer = [self createCircleWithFrame:CGRectMake(0, self.size*0.5 - circleSize*0.5, circleSize, circleSize)
                                            fillColor:self.tintColor
                                          strokeColor:self.tintColor];
    [replicatorLayer addSublayer:layer];
    
    NSArray *fns = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut)];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
    scaleAnimation.keyPath = kCAAnimationKeyPathScale;
    scaleAnimation.values = @[@1.0, @0.6, @1.0];
    scaleAnimation.keyTimes = @[@0.0, @0.5, @1.0];
    scaleAnimation.duration = animationDuration;
    scaleAnimation.timingFunctions = fns;
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animation];
    rotateAnimation.keyPath = kCAAnimationKeyPathRotationZ;
    rotateAnimation.values = @[@0.0, @M_PI, @(M_PI*2)];
    rotateAnimation.keyTimes = @[@0.0, @0.5, @1.0];
    rotateAnimation.duration = animationDuration;
    rotateAnimation.timingFunctions = fns;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[rotateAnimation, scaleAnimation];
    animationGroup.duration = animationDuration;
    animationGroup.repeatCount = HUGE_VALF;
    animationGroup.removedOnCompletion = NO;
    
    [replicatorLayer addAnimation:animationGroup forKey:nil];
}

- (void)startAnimationForBallTrianglePath {
    NSInteger count = 3;
    CGFloat circleSize = self.size / 6;
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    CGFloat animationDuration = 2;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
    [self.layer addSublayer:replicatorLayer];
    
    CGRect frame = CGRectMake(self.size*0.5 - circleSize*0.5, 0, circleSize, circleSize);
    CALayer *dotLayer = [self createCircleWithFrame:frame fillColor:[UIColor clearColor] strokeColor:self.tintColor];
    [replicatorLayer addSublayer:dotLayer];
    
    CATransform3D transform = CATransform3DMakeRotation(M_PI*2/count, 0, 0, 1);
    replicatorLayer.instanceTransform = transform;
    replicatorLayer.instanceCount = count;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = kCAAnimationKeyPathPosition;
    animation.keyTimes = @[@0.0, @0.33, @0.67, @1.0];
    animation.duration = animationDuration;
    animation.repeatCount = HUGE_VALF;
    animation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut)];
    animation.removedOnCompletion = NO;
    
    CGFloat triangleSideLength = cos(M_PI/6)*(self.size*0.5 - circleSize*0.5)*2;
    NSValue *pointValue1 = [NSValue valueWithCGPoint:CGPointMake(self.size*0.5 + triangleSideLength*0.5, cos(M_PI/6)*triangleSideLength + circleSize*0.5)];
    NSValue *pointValue2 = [NSValue valueWithCGPoint:CGPointMake(self.size*0.5 - triangleSideLength*0.5, cos(M_PI/6)*triangleSideLength + circleSize*0.5)];
    animation.values = @[@(dotLayer.position), pointValue1, pointValue2, @(dotLayer.position)];
    
    [dotLayer addAnimation:animation forKey:nil];
}

- (void)startAnimationForBallGridPulse {
    NSInteger count = 3;
    CGFloat circlePadding = 5.0;
    CGFloat circleSize = (self.size - circlePadding*2) / count;
    CGFloat animationDuration = 1;
    NSArray *timeOffset = @[@0.25, @0.83, @-0.22,
                            @0.53, @-0.12, @0.23,
                            @0.72, @0.31, @0.1];
    
    for (int i=0; i<9; i++) {
        NSInteger row = i / count;
        NSInteger line = i % count;
        CGRect frame = CGRectMake((circleSize + circlePadding)*line, (circleSize + circlePadding)*row, circleSize, circleSize);
        CALayer *dotLayer = [self createCircleWithFrame:frame fillColor:self.tintColor strokeColor:self.tintColor];
        [self.layer addSublayer:dotLayer];
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        animation.keyPath = kCAAnimationKeyPathScale;
        animation.values = @[@1.0, @0.4, @1.0];
        animation.keyTimes = @[@0.0, @0.5, @1.0];
        animation.timeOffset = [timeOffset[i] doubleValue];
        animation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseIn), TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut)];
        animation.duration = animationDuration;
        animation.repeatCount = HUGE_VALF;
        animation.removedOnCompletion = NO;
        [dotLayer addAnimation:animation forKey:nil];
    }
}

- (void)startAnimationForBallRound {
    [self startAnimationForBallRoundWithSections:1 totalCount:20];
}

- (void)startAnimationForBallRoundDouble {
    [self startAnimationForBallRoundWithSections:2 totalCount:20];
}

- (void)startAnimationForBallRoundThree {
    [self startAnimationForBallRoundWithSections:3 totalCount:100];
}

- (void)startAnimationForBallRoundWithSections:(NSUInteger)sections totalCount:(NSInteger)totalCount {
    if (sections == 0) {
        return;
    }
    
    NSInteger count = totalCount;
    CGFloat circleSize = self.size / 8;
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    CGFloat animationDuration = 1.0 / sections;
    
    for (int i= 0; i<sections; i++) {
        CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
        replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
        replicatorLayer.transform = CATransform3DMakeRotation(M_PI*2*i/sections, 0, 0, 1);
        [self.layer addSublayer:replicatorLayer];
        
        CGRect frame = CGRectMake(self.size*0.5-circleSize*0.5, 0, circleSize, circleSize);
        CALayer *dotLayer = [self createCircleWithFrame:frame fillColor:self.tintColor strokeColor:self.tintColor];
        dotLayer.transform = CATransform3DMakeScale(0.01, 0.01, 0.01); //解决旋转衔接效果
        [replicatorLayer addSublayer:dotLayer];
        
        CATransform3D transform = CATransform3DMakeRotation(M_PI*2/count, 0, 0, 1);
        replicatorLayer.instanceTransform = transform;
        replicatorLayer.instanceCount = ceil(count/(float)sections);
        replicatorLayer.instanceDelay = animationDuration / replicatorLayer.instanceCount;
        
        CABasicAnimation *animation = [CABasicAnimation animation];
        animation.keyPath = kCAAnimationKeyPathScale;
        animation.fromValue = @1.0;
        animation.toValue = @0.2;
        animation.duration = animationDuration;
        animation.repeatCount = HUGE_VALF;
        animation.removedOnCompletion = NO;
        [dotLayer addAnimation:animation forKey:nil];
    }
}



@end
