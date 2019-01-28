//
//  GTCircleViewController.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/28.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTCircleViewController.h"
#import "GTCircleView.h"
#import "GTTimer.h"
#import "UIView+GTLayout.h"

@interface GTCircleViewController ()

@property (nonatomic, strong) GTTimer *timer;

@end

@implementation GTCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat horizontalMargin = 15;
    CGFloat width = (self.view.width - horizontalMargin*3) / 2;
    GTCircleView *circleView1 = [[GTCircleView alloc] initWithFrame:CGRectMake(horizontalMargin, 150, width, width)
                                                         startAngle:0.0
                                                          strokeEnd:1.0
                                                          lineWidth:2.0
                                                        isClockWise:YES];
    circleView1.strokeColor = [[UIColor greenColor] colorWithAlphaComponent:0.7];
    [self.view addSubview:circleView1];
    
    GTCircleView *circleView2 = [[GTCircleView alloc] initWithFrame:CGRectMake(circleView1.right + horizontalMargin, 150, width, width)
                                                         startAngle:M_PI
                                                          strokeEnd:0.0
                                                          lineWidth:width / 2
                                                        isClockWise:YES];
    circleView2.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.6];
    [self.view addSubview:circleView2];
    
    GTCircleView *circleView3 = [[GTCircleView alloc] initWithFrame:CGRectMake(horizontalMargin, circleView1.bottom + 15, width, width)
                                                         startAngle:0.0
                                                          strokeEnd:0.0
                                                          lineWidth:2.0
                                                        isClockWise:YES];
    [self.view addSubview:circleView3];
    
    
    GTCircleView *circleView4 = [[GTCircleView alloc] initWithFrame:CGRectMake(circleView3.right + horizontalMargin, circleView1.bottom + 15, width, width)
                                                         startAngle:0.0
                                                          strokeEnd:0.0
                                                          lineWidth:width / 2
                                                        isClockWise:YES];
    [self.view addSubview:circleView4];
    
    self.timer = [GTTimer timerWithTimerInterval:1.5 repeats:YES block:^(GTTimer *timer) {
        CGFloat percent = arc4random() % 100 / 100.0;
        CGFloat anotherPercent = arc4random() % 100 / 100.0;
        CGFloat strokeStart = MIN(percent, anotherPercent);
        CGFloat strokeEnd = MAX(percent, anotherPercent);
        
        [circleView1 startAnimationWithStrokeStart:strokeStart duration:1.0 timingFunction:kCAMediaTimingFunctionLinear];
        [circleView2 startAnimationWithStrokeEnd:strokeEnd duration:1.0 timingFunction:kCAMediaTimingFunctionLinear];

        [circleView3 startAnimationWithStrokeStart:strokeStart duration:1.0 timingFunction:kCAMediaTimingFunctionLinear];
        [circleView3 startAnimationWithStrokeEnd:strokeEnd duration:1.0 timingFunction:kCAMediaTimingFunctionLinear];
        
        [circleView4 startAnimationWithStrokeStart:strokeStart duration:1.0 timingFunction:kCAMediaTimingFunctionLinear];
        [circleView4 startAnimationWithStrokeEnd:strokeEnd duration:1.0 timingFunction:kCAMediaTimingFunctionLinear];
    }];
}


@end
