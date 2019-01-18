//
//  CALayer+Animation.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/17.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "CALayer+Animation.h"

//Uses the default implied CABasicAnimation object
NSString *const kCAAnimationKeyPathTransform       = @"transform";
NSString *const kCAAnimationKeyPathRotation        = @"transform.rotation";
NSString *const kCAAnimationKeyPathRotationX       = @"transform.rotation.x";
NSString *const kCAAnimationKeyPathRotationY       = @"transform.rotation.y";
NSString *const kCAAnimationKeyPathRotationZ       = @"transform.rotation.z";
NSString *const kCAAnimationKeyPathScale           = @"transform.scale";
NSString *const kCAAnimationKeyPathScaleX          = @"transform.scale.x";
NSString *const kCAAnimationKeyPathScaleY          = @"transform.scale.y";
NSString *const kCAAnimationKeyPathScaleZ          = @"transform.scale.z";
NSString *const kCAAnimationKeyPathTranslation     = @"transform.translation";
NSString *const kCAAnimationKeyPathTranslationX    = @"transform.translation.x";
NSString *const kCAAnimationKeyPathTranslationY    = @"transform.translation.y";
NSString *const kCAAnimationKeyPathTranslationZ    = @"transform.translation.z";

NSString *const kCAAnimationKeyPathPosition        = @"position";
NSString *const kCAAnimationKeyPathPositionX       = @"position.x";
NSString *const kCAAnimationKeyPathPositionY       = @"position.y";

NSString *const kCAAnimationKeyPathBounds          = @"bounds";
NSString *const kCAAnimationKeyPathSize            = @"bounds.size";
NSString *const kCAAnimationKeyPathSizeWidth       = @"bounds.size.width";
NSString *const kCAAnimationKeyPathSizeHeight      = @"bounds.size.height";

NSString *const kCAAnimationKeyPathBorderColor     = @"borderColor";
NSString *const kCAAnimationKeyPathBorderWidth     = @"borderWidth";

NSString *const kCAAnimationKeyPathShadowColor     = @"shadowColor";
NSString *const kCAAnimationKeyPathShadowOffset    = @"shadowOffset";
NSString *const kCAAnimationKeyPathShadowOpacity   = @"shadowOpacity";
NSString *const kCAAnimationKeyPathShadowPath      = @"shadowPath";

NSString *const kCAAnimationKeyPathContents        = @"contents";
NSString *const kCAAnimationKeyPathContentsRect    = @"contentsRect";

NSString *const kCAAnimationKeyPathSublayers          = @"sublayers";
NSString *const kCAAnimationKeyPathSublayerTransform  = @"sublayerTransform";

NSString *const kCAAnimationKeyPathMask            = @"mask";
NSString *const kCAAnimationKeyPathMasksToBounds   = @"masksToBounds";

NSString *const kCAAnimationKeyPathOpacity         = @"opacity";
NSString *const kCAAnimationKeyPathAnchorPoint     = @"anchorPoint";
NSString *const kCAAnimationKeyPathBackgroundColor = @"backgroundColor";
NSString *const kCAAnimationKeyPathCornerRadius    = @"cornerRadius";
NSString *const kCAAnimationKeyPathFilters         = @"filters";
NSString *const kCAAnimationKeyPathHidden          = @"hidden";
NSString *const kCAAnimationKeyPathZPosition       = @"zPosition";

//Uses the default implied CATransition object
NSString *const kCAAnimationKeyPathBackgroundFilters = @"backgroundFilters";
NSString *const kCAAnimationKeyPathCompositingFilter = @"compositingFilter";


@interface _GTAnimationDelegate : NSObject <CAAnimationDelegate>

@property (nonatomic, copy) void (^block)(BOOL);

- (instancetype)initWithBlock:(void (^)(BOOL))block;

@end

@implementation _GTAnimationDelegate

- (instancetype)initWithBlock:(void (^)(BOOL))block {
    self = [super init];
    if (self) {
        self.block = block;
    }
    return self;
}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (self.block) {
        self.block(flag);
    }
}

@end

///////////////////////////////////////////////////////////////////////////////////////
@implementation CALayer (Animation)

- (void)startAnimation:(CAAnimation *)animation completion:(void (^)(BOOL))completion {
    _GTAnimationDelegate *animationDelegate = [[_GTAnimationDelegate alloc] initWithBlock:completion];
    animation.delegate = animationDelegate;
    [self addAnimation:animation forKey:nil];
}

- (void)pauseAnimations {
    CFTimeInterval pauseTime = [self convertTime:CACurrentMediaTime() fromLayer:nil];
    self.timeOffset = pauseTime;
    self.speed = 0.0;
}

- (void)resumeAnimations {
    CFTimeInterval pauseTime = self.timeOffset;
    
    self.timeOffset = 0;
    self.speed = 1.0;
    
    CFTimeInterval timeSincePause = [self convertTime:CACurrentMediaTime() toLayer:nil] - pauseTime;
    self.timeOffset = -timeSincePause;
}

@end
