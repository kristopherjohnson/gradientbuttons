//
//  GradientButtonsViewController.m
//  GradientButtons
//
//  Created by Kristopher Johnson on 2/26/10.
//  Copyright Capable Hands Technologies, Inc. 2010. All rights reserved.
//

#import "GradientButtonsViewController.h"


@implementation GradientButtonsViewController


- (IBAction)colorButtonClicked:(UIButton *)sender {
    
    // Set view's background to match button color
    self.view.backgroundColor = sender.backgroundColor;
}


@end
