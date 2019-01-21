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
#import "GTTimingFunctionCurveGraphView.h"

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
            
        case GTActivityIndicatorAnimationTypeBallScaleMultiple:
            [self startAnimationForBallScaleMultiple];
            break;
            
        case GTActivityIndicatorAnimationTypeRipple:
            [self startAnimationForRipple];
            break;
            
        case GTActivityIndicatorAnimationTypeLineScale:
            [self startAnimationForLineScale];
            break;
            
        case GTActivityIndicatorAnimationTypeLineScaleParty:
            [self startAnimationForLineScaleParty];
            break;
            
        case GTActivityIndicatorAnimationTypeLineScaleImpulse:
            [self startAnimationForLineScaleImpulse];
            break;
            
        case GTActivityIndicatorAnimationTypeLineScaleImpulseRapid:
            [self startAnimationForScaleImpulseRapid];
            break;
            
        case GTActivityIndicatorAnimationTypeArcRotation:
            [self startAnimationForArcRotation];
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
    [self startAnimationForBallRoundWithSections:1 totalCount:15];
}

- (void)startAnimationForBallRoundDouble {
    [self startAnimationForBallRoundWithSections:2 totalCount:14];
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

- (void)startAnimationForBallScaleMultiple {
    NSUInteger count = 4;
    CGFloat animationDuration = 1.8;
    CGFloat segments = 0.8;
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
    replicatorLayer.instanceCount = count;
    replicatorLayer.instanceDelay = 0.25;
    [self.layer addSublayer:replicatorLayer];
    
    CALayer *ballLayer = [self createCircleWithFrame:replicatorLayer.bounds fillColor:self.tintColor strokeColor:self.tintColor];
    ballLayer.transform = CATransform3DMakeScale(0.01, 0.01, 1);
    [replicatorLayer addSublayer:ballLayer];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
    scaleAnimation.keyPath = kCAAnimationKeyPathScale;
    scaleAnimation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionLinear)];
    scaleAnimation.values = @[@0.0, @1.0, @1.0];
    scaleAnimation.keyTimes = @[@0.0, @(segments), @1.0];
    scaleAnimation.duration = animationDuration;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animation];
    opacityAnimation.keyPath = kCAAnimationKeyPathOpacity;
    opacityAnimation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionLinear)];
    opacityAnimation.values = @[@1.0, @0.0, @0.0];
    opacityAnimation.keyTimes = @[@0.0, @(segments), @1.0];
    opacityAnimation.duration = animationDuration;
    
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[scaleAnimation, opacityAnimation];
    groupAnimation.duration = animationDuration;
    groupAnimation.repeatCount = HUGE_VALF;
    groupAnimation.removedOnCompletion = NO;
    [ballLayer addAnimation:groupAnimation forKey:nil];
}

- (void)startAnimationForRipple {
    NSUInteger count = 3;
    CGFloat animationDuration = 1.5;
    CGFloat segments = 0.9;
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
    replicatorLayer.instanceCount = count;
    replicatorLayer.instanceDelay = 0.2;
    [self.layer addSublayer:replicatorLayer];
    
    CAShapeLayer *ballLayer = [self createCircleWithFrame:replicatorLayer.bounds fillColor:[UIColor clearColor] strokeColor:self.tintColor];
    ballLayer.lineWidth = 2;
    ballLayer.transform = CATransform3DMakeScale(0.01, 0.01, 1);
    [replicatorLayer addSublayer:ballLayer];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
    scaleAnimation.keyPath = kCAAnimationKeyPathScale;
    scaleAnimation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionLinear)];
    scaleAnimation.values = @[@0.0, @1.0, @1.0];
    scaleAnimation.keyTimes = @[@0.0, @(segments), @1.0];
    scaleAnimation.duration = animationDuration;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animation];
    opacityAnimation.keyPath = kCAAnimationKeyPathOpacity;
    opacityAnimation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionLinear)];
    opacityAnimation.values = @[@1.0, @.6, @0.0];
    opacityAnimation.keyTimes = @[@0.0, @(segments), @1.0];
    opacityAnimation.duration = animationDuration;

    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[scaleAnimation, opacityAnimation];
    groupAnimation.duration = animationDuration;
    groupAnimation.repeatCount = HUGE_VALF;
    groupAnimation.removedOnCompletion = NO;
    [ballLayer addAnimation:groupAnimation forKey:nil];
}

- (void)startAnimationForLineScale {
    NSInteger count = 5;
    CGFloat animationDuration = 1.0;
    CGFloat lineWidth = self.size / (count*2 - 1);
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = CGRectMake(originX, originY, self.size, self.size);
    replicatorLayer.instanceCount = count;
    replicatorLayer.instanceDelay = animationDuration / (count*2);
    CATransform3D transform = CATransform3DMakeTranslation(lineWidth*2, 0, 0);
    replicatorLayer.instanceTransform = transform;
    [self.layer addSublayer:replicatorLayer];
    
    CAShapeLayer *lineLayer = [CAShapeLayer layer];
    lineLayer.frame = CGRectMake(0, 0, lineWidth, self.size);
    lineLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, lineWidth, self.size) cornerRadius:lineWidth*0.5].CGPath;
    lineLayer.fillColor = self.tintColor.CGColor;
    lineLayer.lineWidth = lineWidth;
    [replicatorLayer addSublayer:lineLayer];
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
    scaleAnimation.keyPath = kCAAnimationKeyPathScaleY;
    scaleAnimation.values = @[@1.0, @0.4, @1.0];
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2f :0.68f :0.18f :1.08f];
    scaleAnimation.timingFunctions = @[timingFunction, timingFunction];
    scaleAnimation.keyTimes = @[@0.0, @0.5, @1.0];
    scaleAnimation.duration = animationDuration;
    scaleAnimation.repeatCount = HUGE_VALF;
    scaleAnimation.removedOnCompletion = NO;
    
    [lineLayer addAnimation:scaleAnimation forKey:nil];
}

- (void)startAnimationForLineScaleParty {
    NSArray *animationDurations = @[@0.5, @1.1, @0.9, @0.7];
    CGFloat lineWidth = self.size / (animationDurations.count*2 - 1);
    
    for (int i = 0; i < animationDurations.count; i++) {
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.frame = CGRectMake(lineWidth*2*i, 0, lineWidth, self.size);
        lineLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, lineWidth, self.size) cornerRadius:lineWidth*0.5].CGPath;
        lineLayer.fillColor = self.tintColor.CGColor;
        lineLayer.lineWidth = lineWidth;
        [self.layer addSublayer:lineLayer];
        
        CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
        scaleAnimation.keyPath = kCAAnimationKeyPathScale;
        scaleAnimation.values = @[@1.0, @0.5, @1.0];
        scaleAnimation.keyTimes = @[@0.0, @0.5, @1.0];
        scaleAnimation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionEaseIn)];
        scaleAnimation.removedOnCompletion = NO;
        scaleAnimation.duration = [animationDurations[i] floatValue];
        scaleAnimation.repeatCount = HUGE_VALF;
        [lineLayer addAnimation:scaleAnimation forKey:nil];
    }
}

- (void)startAnimationForLineScaleImpulse {
    CGFloat animationDuration = 1.0;
    NSArray *beginTimes = @[@0.0, @0.2, @0.4, @0.2, @0.0];
    CGFloat lineWidth = self.size / (beginTimes.count*2 - 1);
    
    for (int i = 0; i < beginTimes.count; i++) {
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.frame = CGRectMake(lineWidth*2*i, 0, lineWidth, self.size);
        lineLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, lineWidth, self.size) cornerRadius:lineWidth*0.5].CGPath;
        lineLayer.fillColor = self.tintColor.CGColor;
        lineLayer.lineWidth = lineWidth;
        [self.layer addSublayer:lineLayer];
        
        CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
        scaleAnimation.keyPath = kCAAnimationKeyPathScaleY;
        scaleAnimation.values = @[@1.0, @0.3, @1.0];
        scaleAnimation.keyTimes = @[@0.0, @0.5, @1.0];
        CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.85f :0.25f :0.37f :0.85f];
        scaleAnimation.timingFunctions = @[timingFunction, timingFunction];
        scaleAnimation.removedOnCompletion = NO;
        scaleAnimation.duration = animationDuration;
        scaleAnimation.beginTime = [beginTimes[i] floatValue];
        scaleAnimation.repeatCount = HUGE_VALF;
        [lineLayer addAnimation:scaleAnimation forKey:nil];
    }
}

- (void)startAnimationForScaleImpulseRapid {
    CGFloat animationDuration = 0.9;
    NSArray *beginTimes = @[@0.5, @0.25, @0.0, @0.25, @0.5];
    CGFloat lineWidth = self.size / (beginTimes.count*2 - 1);

    for (int i = 0; i < beginTimes.count; i++) {
        CAShapeLayer *lineLayer = [CAShapeLayer layer];
        lineLayer.frame = CGRectMake(lineWidth*2*i, 0, lineWidth, self.size);
        lineLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, lineWidth, self.size) cornerRadius:lineWidth*0.5].CGPath;
        lineLayer.fillColor = self.tintColor.CGColor;
        lineLayer.lineWidth = lineWidth;
        [self.layer addSublayer:lineLayer];

        CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
        scaleAnimation.keyPath = kCAAnimationKeyPathScaleY;
        scaleAnimation.values = @[@1.0, @0.3, @1.0];
        scaleAnimation.keyTimes = @[@0.0, @0.8, @0.9];
        CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.11f :0.49f :0.38f :0.78f];
        scaleAnimation.timingFunctions = @[timingFunction, timingFunction];
        scaleAnimation.removedOnCompletion = NO;
        scaleAnimation.duration = animationDuration;
        scaleAnimation.beginTime = [beginTimes[i] floatValue];
        scaleAnimation.repeatCount = HUGE_VALF;
        [lineLayer addAnimation:scaleAnimation forKey:nil];
    }
}

- (void)startAnimationForArcRotation {
    CAShapeLayer * (^circleLayerFactory)(CGRect, CGFloat, BOOL) = ^(CGRect frame, CGFloat startAngle, BOOL isReverses) {
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        circleLayer.frame = frame;
        
        CGFloat radius = frame.size.width*0.5;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:startAngle endAngle:startAngle + M_PI_2 clockwise:YES];
        [path moveToPoint:CGPointMake(radius + cos(startAngle + M_PI)*radius, radius + sin(startAngle + M_PI)*radius)];
        [path addArcWithCenter:CGPointMake(radius, radius) radius:radius startAngle:startAngle+M_PI endAngle:startAngle+M_PI+M_PI_2 clockwise:YES];
        circleLayer.path = path.CGPath;
        circleLayer.fillColor = [UIColor clearColor].CGColor;
        circleLayer.strokeColor = self.tintColor.CGColor;
        circleLayer.lineWidth = 2;
        
        CGFloat animationDuration = 0.9;
        CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
        scaleAnimation.keyPath = kCAAnimationKeyPathScale;
        scaleAnimation.values = @[@1.0, @0.6, @1.0];
        scaleAnimation.keyTimes = @[@0.0, @0.5, @1.0];
        scaleAnimation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseInEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionEaseInEaseOut)];
        scaleAnimation.duration = animationDuration;
        
        CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animation];
        rotationAnimation.keyPath = kCAAnimationKeyPathRotationZ;
        rotationAnimation.values = isReverses ? @[@0.0, @(-M_PI), @(-M_PI*2)]: @[@0.0, @(M_PI), @(M_PI*2)];
        rotationAnimation.keyTimes = @[@0.0, @0.5, @1.0];
        rotationAnimation.timingFunctions = @[TIMING_FUNCTION(kCAMediaTimingFunctionEaseInEaseOut), TIMING_FUNCTION(kCAMediaTimingFunctionEaseInEaseOut)];
        rotationAnimation.duration = animationDuration;
        
        CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
        animationGroup.animations = @[rotationAnimation, scaleAnimation];
        animationGroup.duration = animationDuration;
        animationGroup.repeatCount = HUGE_VALF;
        animationGroup.removedOnCompletion = NO;
        if (isReverses) {
            CFTimeInterval currentLayerTime = [circleLayer convertTime:CACurrentMediaTime() fromLayer:nil];
            animationGroup.beginTime = currentLayerTime - animationDuration*0.5;
        }
        
        [circleLayer addAnimation:animationGroup forKey:nil];
        return circleLayer;
    };
    
    CGFloat originX = (self.layer.frame.size.width - self.size) / 2;
    CGFloat originY = (self.layer.frame.size.height - self.size) / 2;
    CAShapeLayer *bigCircleLayer = circleLayerFactory(CGRectMake(originX, originY, self.size, self.size), -M_PI/4, NO);
    [self.layer addSublayer:bigCircleLayer];

    CGFloat smallRadius = self.size * 0.4;
    CGRect frame = CGRectMake((self.layer.frame.size.height - smallRadius)*0.5, (self.layer.frame.size.height - smallRadius)*0.5, smallRadius, smallRadius);
    CAShapeLayer *smallCircleLayer = circleLayerFactory(frame, M_PI/4, YES);
    [self.layer addSublayer:smallCircleLayer];

}

@end
