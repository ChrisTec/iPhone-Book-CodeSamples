//
//  CoinTossViewController.m
//  CoinToss
//
//  Created by Amos Bannister on 10/05/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoinTossViewController.h"
#include <QuartzCore/QuartzCore.h>

@implementation CoinTossViewController

@synthesize status, result;

- (void) simulateCoinToss:(BOOL)usercalledHeads {
    BOOL coinLandedOnHeads = (arc4random() % 2) == 0;
    
    result.text = coinLandedOnHeads ? @"Heads" : @"Tails";
    
    if(coinLandedOnHeads == usercalledHeads)
        status.text = @"Correct!";
    else
        status.text = @"Wrong!";
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rotation.fromValue = [NSNumber numberWithFloat:0.0f];
    rotation.toValue = [NSNumber numberWithFloat:720 * M_PI / 180.0f];
    rotation.duration = 2.0f;
    [status.layer addAnimation:rotation forKey:@"rotate"];
    
    CABasicAnimation *fade = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fade.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    fade.fromValue = [NSNumber numberWithFloat:0.0f];
    fade.toValue = [NSNumber numberWithFloat:1.0f];
    fade.duration = 3.5f;
    [status.layer addAnimation:fade forKey:@"fade"];
}

- (IBAction) callHeads{
    [self simulateCoinToss:YES];
}

- (IBAction) callTails{
    [self simulateCoinToss:NO];
}

- (void)viewDidUnload
{
    self.status = nil;
    self.result = nil;
}

- (void)dealloc
{
    [status release];
    [result release];
    [super dealloc];
}

@end
