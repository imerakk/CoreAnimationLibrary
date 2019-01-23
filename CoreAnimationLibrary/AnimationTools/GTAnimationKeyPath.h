//
//  GTAnimationKeyPath.h
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/22.
//  Copyright © 2019年 imera. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 From:
 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html
 https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreAnimation_guide/Key-ValueCodingExtensions/Key-ValueCodingExtensions.html
 
 CALayer Animatable Properties
 */

//Uses the default implied CABasicAnimation object
extern NSString *const kCAAnimationKeyPathTransform;
extern NSString *const kCAAnimationKeyPathRotation;
extern NSString *const kCAAnimationKeyPathRotationX;
extern NSString *const kCAAnimationKeyPathRotationY;
extern NSString *const kCAAnimationKeyPathRotationZ;
extern NSString *const kCAAnimationKeyPathScale;
extern NSString *const kCAAnimationKeyPathScaleX;
extern NSString *const kCAAnimationKeyPathScaleY;
extern NSString *const kCAAnimationKeyPathScaleZ;
extern NSString *const kCAAnimationKeyPathTranslation;
extern NSString *const kCAAnimationKeyPathTranslationX;
extern NSString *const kCAAnimationKeyPathTranslationY;
extern NSString *const kCAAnimationKeyPathTranslationZ;

extern NSString *const kCAAnimationKeyPathPosition;
extern NSString *const kCAAnimationKeyPathPositionX;
extern NSString *const kCAAnimationKeyPathPositionY;

extern NSString *const kCAAnimationKeyPathBounds;
extern NSString *const kCAAnimationKeyPathSize;
extern NSString *const kCAAnimationKeyPathSizeWidth;
extern NSString *const kCAAnimationKeyPathSizeHeight;

extern NSString *const kCAAnimationKeyPathBorderColor;
extern NSString *const kCAAnimationKeyPathBorderWidth;

extern NSString *const kCAAnimationKeyPathShadowColor;
extern NSString *const kCAAnimationKeyPathShadowOffset;
extern NSString *const kCAAnimationKeyPathShadowOpacity;
extern NSString *const kCAAnimationKeyPathShadowPath;

extern NSString *const kCAAnimationKeyPathContents;
extern NSString *const kCAAnimationKeyPathContentsRect;

extern NSString *const kCAAnimationKeyPathSublayers;
extern NSString *const kCAAnimationKeyPathSublayerTransform;

extern NSString *const kCAAnimationKeyPathMask;
extern NSString *const kCAAnimationKeyPathMasksToBounds;

extern NSString *const kCAAnimationKeyPathOpacity;
extern NSString *const kCAAnimationKeyPathAnchorPoint;
extern NSString *const kCAAnimationKeyPathBackgroundColor;
extern NSString *const kCAAnimationKeyPathCornerRadius;
extern NSString *const kCAAnimationKeyPathFilters;
extern NSString *const kCAAnimationKeyPathHidden;
extern NSString *const kCAAnimationKeyPathZPosition;

//Uses the default implied CATransition object
extern NSString *const kCAAnimationKeyPathBackgroundFilters;
extern NSString *const kCAAnimationKeyPathCompositingFilter;

// CAShapeLayer Animatable Properties
extern NSString *const kCAAnimationKeyPathPath;
extern NSString *const kCAAnimationKeyPathFillColor;
extern NSString *const kCAAnimationKeyPathStrokeColor;
extern NSString *const kCAAnimationKeyPathStrokeStart;
extern NSString *const kCAAnimationKeyPathStrokeEnd;
extern NSString *const kCAAnimationKeyPathLineWidth;
extern NSString *const kCAAnimationKeyPathMiterLimit;
extern NSString *const kCAAnimationKeyPathLineDashPhase;

// CAReplicatorLayer Animatable Properties
extern NSString *const kCAAnimationKeyPathInstanceCount;
extern NSString *const kCAAnimationKeyPathInstanceDelay;
extern NSString *const kCAAnimationKeyPathInstanceTransform;
extern NSString *const kCAAnimationKeyPathInstanceColor;
extern NSString *const kCAAnimationKeyPathInstanceRedOffset;
extern NSString *const kCAAnimationKeyPathInstanceGreenOffset;
extern NSString *const kCAAnimationKeyPathInstanceBlueOffset;
extern NSString *const kCAAnimationKeyPathInstanceAlphaOffset;
