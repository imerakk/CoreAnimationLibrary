//
//  GTCardOverTurnViewController.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/14.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTCardOverTurnViewController.h"
#import "UIView+Animation.h"

@interface GTCardOverTurnViewController ()

@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UIView *frontView;
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UITextField *durationTextField;
@property (weak, nonatomic) IBOutlet UISwitch *isVeritcalSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *isClockwiseSwitch;

@end

@implementation GTCardOverTurnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *tapGest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.frontView addGestureRecognizer:tapGest];
}

- (IBAction)startAnimation:(id)sender {
    __weak typeof(self) weakSelf = self;
    [self.mainView cardOverTurnAnimationWithFront:self.frontView
                                             back:self.backView
                                         duration:[self.durationTextField.text doubleValue]
                                      orientation:self.isVeritcalSwitch.isOn ? GTOrientationVeritcal : GTOrientationHorizontal isClockwise:self.isClockwiseSwitch.isOn
                                       completion:^(BOOL success) {
        NSLog(@"animation completion success %@", success ? @"success" : @"failed");
                                           UIView *tempView = weakSelf.backView;
                                           weakSelf.backView = weakSelf.frontView;
                                           weakSelf.frontView = tempView;
                                       }];
}

- (void)tap {
    NSLog(@"tap");
}

@end
