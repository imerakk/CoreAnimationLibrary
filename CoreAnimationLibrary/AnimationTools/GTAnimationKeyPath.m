//
//  GTAnimationKeyPath.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/22.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTAnimationKeyPath.h"

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

// CAShapeLayer Animatable Properties
NSString *const kCAAnimationKeyPathPath           = @"path";
NSString *const kCAAnimationKeyPathFillColor      = @"fillColor";
NSString *const kCAAnimationKeyPathStrokeColor    = @"strokeColor";
NSString *const kCAAnimationKeyPathStrokeStart    = @"strokeStart";
NSString *const kCAAnimationKeyPathStrokeEnd      = @"strokeEnd";
NSString *const kCAAnimationKeyPathLineWidth      = @"lineWidth";
NSString *const kCAAnimationKeyPathMiterLimit     = @"miterLimit";
NSString *const kCAAnimationKeyPathLineDashPhase  = @"lineDashPhase";

// CAReplicatorLayer Animatable Properties
NSString *const kCAAnimationKeyPathInstanceCount        = @"instanceCount";
NSString *const kCAAnimationKeyPathInstanceDelay        = @"instanceDelay";
NSString *const kCAAnimationKeyPathInstanceTransform    = @"instanceTransform";
NSString *const kCAAnimationKeyPathInstanceColor        = @"instanceColor";
NSString *const kCAAnimationKeyPathInstanceRedOffset    = @"instanceRedOffset";
NSString *const kCAAnimationKeyPathInstanceGreenOffset  = @"instanceGreenOffset";
NSString *const kCAAnimationKeyPathInstanceBlueOffset   = @"instanceBlueOffset";
NSString *const kCAAnimationKeyPathInstanceAlphaOffset  = @"instanceAlphaOffset";
