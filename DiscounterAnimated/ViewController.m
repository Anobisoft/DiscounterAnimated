//
//  ViewController.m
//  DiscounterAnimated
//
//  Created by Stanislav Pletnev on 02.11.16.
//  Copyright © 2016 anobisoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController {
    __weak IBOutlet UIView *discounterView;
    __weak IBOutlet UIView *discounterAnimatedView;
    CAKeyframeAnimation *animation;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    discounterView.transform = CGAffineTransformMakeRotation(atan(-0.4));
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    NSMutableArray *mutableArray = [NSMutableArray new];
    for (int i = 0; i <= 20; i++) {
        [mutableArray addObject:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI * 2 * i / 20, -1.0f, 0.4f, 0.0f)]];
    }
    animation.values = mutableArray.copy;
    animation.autoreverses = NO;
    animation.repeatCount = 2.0f ;
    animation.duration = 0.6f ;
    [discounterAnimatedView.layer addAnimation:animation forKey:nil];
    discounterAnimatedView.layer.zPosition = discounterView.layer.bounds.size.height / 2 +1;
}

- (IBAction)restartTap:(id)sender {
    [discounterAnimatedView.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
