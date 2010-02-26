//
//  GradientButton.h
//  GradientButtons
//
//  Created by Kristopher Johnson on 2/26/10.
//  Copyright 2010 Capable Hands Technologies, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface GradientButton : UIButton {
    CAGradientLayer *shineLayer;
    CALayer         *highlightLayer;
}

@end
