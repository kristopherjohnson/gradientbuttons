//
//  GradientButtonsAppDelegate.h
//  GradientButtons
//
//  Created by Kristopher Johnson on 2/26/10.
//  Copyright Capable Hands Technologies, Inc. 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GradientButtonsViewController;

@interface GradientButtonsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    GradientButtonsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet GradientButtonsViewController *viewController;

@end

