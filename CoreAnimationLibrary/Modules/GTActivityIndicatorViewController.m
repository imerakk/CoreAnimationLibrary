//
//  GTActivityIndicatorViewController.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/17.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTActivityIndicatorViewController.h"
#import "GTActivityIndicatorView.h"
#import "UIView+GTLayout.h"


@interface GTActivityIndicatorViewController ()

@property (nonatomic, strong) NSMutableArray *indicatorViews;

@end

@implementation GTActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:85/255.0f blue:101/255.0f alpha:1.0f];
    
    [self setupIndicators];
    [self setupStartButton];
}

- (void)setupIndicators {
    NSArray *indicatorTypes = @[@(GTActivityIndicatorAnimationTypeThreeDots),
                                @(GTActivityIndicatorAnimationTypeBallBounces),
                                @(GTActivityIndicatorAnimationTypeBallRotation),
                                @(GTActivityIndicatorAnimationTypeBallTrianglePath),
                                @(GTActivityIndicatorAnimationTypeBallGridPulse),
                                @(GTActivityIndicatorAnimationTypeBallRound),
                                @(GTActivityIndicatorAnimationTypeBallRoundDouble),
                                @(GTActivityIndicatorAnimationTypeBallRoundThree)];
    self.indicatorViews = [NSMutableArray array];
    
    NSInteger count = 5;
    CGFloat size = 50;
    CGFloat linePadding = (self.view.width - count * size) / (count + 1);
    CGFloat rowPadding = 10;
    
    for (int i=0; i<indicatorTypes.count; i++) {
        NSInteger row = i / 5;
        NSInteger line = i % 5;
        CGFloat X = linePadding + (linePadding + size) * line;
        CGFloat Y = rowPadding + (rowPadding + size) * row;
        CGFloat barHeight = self.navigationController.navigationBar.height + [[UIApplication sharedApplication] statusBarFrame].size.height;
        Y += barHeight;
        
        GTActivityIndicatorAnimationType type = [indicatorTypes[i] integerValue];
        GTActivityIndicatorView *view = [[GTActivityIndicatorView alloc] initWithType:type size:size];
        view.frame = CGRectMake(X, Y, size, size);
        [self.view addSubview:view];
        [self.indicatorViews addObject:view];
        [view startAnimation];
    }
}

- (void)setupStartButton {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.size = CGSizeMake(100, 40);
    btn.center = CGPointMake(self.view.width / 2, self.view.height - 50);
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitle:@"pause" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)startAnimation:(UIButton *)btn {
    if ([btn.titleLabel.text isEqualToString:@"pause"]) {
        [self.indicatorViews makeObjectsPerformSelector:@selector(pauseAnimation)];
        [btn setTitle:@"resume" forState:UIControlStateNormal];
    }
    else if ([btn.titleLabel.text isEqualToString:@"resume"]) {
        [self.indicatorViews makeObjectsPerformSelector:@selector(resumeAnimation)];
        [btn setTitle:@"pause" forState:UIControlStateNormal];
    }
}

@end
