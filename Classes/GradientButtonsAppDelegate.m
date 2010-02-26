//
//  GradientButtonsAppDelegate.m
//  GradientButtons
//
//  Created by Kristopher Johnson on 2/26/10.
//  Copyright Capable Hands Technologies, Inc. 2010. All rights reserved.
//

#import "GradientButtonsAppDelegate.h"
#import "GradientButtonsViewController.h"

@implementation GradientButtonsAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
