//
//  GradientButton.m
//  GradientButtons
//
//  Created by Kristopher Johnson on 2/26/10.
//  Copyright 2010 Capable Hands Technologies, Inc.. All rights reserved.
//

#import "GradientButton.h"


@interface GradientButton ()
- (void)initBorder;
- (void)addShineLayer;
- (void)addHighlightLayer;
@end


@implementation GradientButton


#pragma mark -
#pragma mark Initialization


- (void)awakeFromNib {
    [self initBorder];
    [self addShineLayer];
    [self addHighlightLayer];
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initBorder];
        [self addShineLayer];
        [self addHighlightLayer];
    }
    return self;
}


- (void)initBorder {
    CALayer *layer = self.layer;
    layer.cornerRadius = 8.0f;
    layer.masksToBounds = YES;
    layer.borderWidth = 1.0f;
    layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.2f].CGColor;
}


- (void)addShineLayer {
    shineLayer = [CAGradientLayer layer];
    shineLayer.frame = self.layer.bounds;
    shineLayer.colors = [NSArray arrayWithObjects:
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                         (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                         nil];
    shineLayer.locations = [NSArray arrayWithObjects:
                            [NSNumber numberWithFloat:0.0f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.5f],
                            [NSNumber numberWithFloat:0.8f],
                            [NSNumber numberWithFloat:1.0f],
                            nil];
    [self.layer addSublayer:shineLayer];
}


- (void)addHighlightLayer {
    highlightLayer = [CALayer layer];
    highlightLayer.backgroundColor = [UIColor colorWithWhite:0.75f alpha:0.9].CGColor;
    highlightLayer.frame = self.layer.bounds;
    highlightLayer.hidden = YES;
    [self.layer insertSublayer:highlightLayer below:shineLayer];
}


#pragma mark -
#pragma mark Highlight button while touched


- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    if ([super beginTrackingWithTouch:touch withEvent:event]) {
        highlightLayer.hidden = NO;
        return YES;
    }
    return NO;
}


- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    highlightLayer.hidden = YES;
    [super endTrackingWithTouch:touch withEvent:event];
}


- (void)cancelTrackingWithEvent:(UIEvent *)event {
    highlightLayer.hidden = YES;
    [super cancelTrackingWithEvent:event];
}


@end
