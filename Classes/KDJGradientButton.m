//
//  KDJGradientButton.m
//  GradientButtons
//
//  Created by Kristopher Johnson on 2/26/10.
//  Copyright 2010, 2013 Capable Hands Technologies, Inc.
//
// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#import "KDJGradientButton.h"


@interface KDJGradientButton ()

@property (nonatomic, weak) CAGradientLayer *shineLayer;
@property (nonatomic, weak) CALayer         *highlightLayer;

@end


@implementation KDJGradientButton


#pragma mark -
#pragma mark Initialization


- (void)awakeFromNib {
    [self initLayers];
}


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initLayers];
    }
    return self;
}


- (id)init {
    return [self initWithFrame:CGRectZero];
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.shineLayer.frame = self.layer.bounds;
    self.highlightLayer.frame = self.layer.bounds;
}


- (void)initLayers {
    [self initBorder];
    [self addShineLayer];
    [self addHighlightLayer];
}


- (void)initBorder {
    CALayer *layer = self.layer;
    layer.cornerRadius = 8.0f;
    layer.masksToBounds = YES;
    layer.borderWidth = 1.0f;
    layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.2f].CGColor;
}


- (void)addShineLayer {
    CAGradientLayer *shineLayer = [CAGradientLayer layer];
    self.shineLayer = shineLayer;
    shineLayer.frame = self.layer.bounds;
    
    shineLayer.colors = @[(id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor,
                          (id)[UIColor colorWithWhite:1.0f alpha:0.2f].CGColor,
                          (id)[UIColor colorWithWhite:0.75f alpha:0.2f].CGColor,
                          (id)[UIColor colorWithWhite:0.4f alpha:0.2f].CGColor,
                          (id)[UIColor colorWithWhite:1.0f alpha:0.4f].CGColor];
    
    shineLayer.locations = @[[NSNumber numberWithFloat:0.0f],
                             [NSNumber numberWithFloat:0.5f],
                             [NSNumber numberWithFloat:0.5f],
                             [NSNumber numberWithFloat:0.8f],
                             [NSNumber numberWithFloat:1.0f]];
    
    [self.layer addSublayer:shineLayer];
}


#pragma mark -
#pragma mark Highlight button while touched


- (void)addHighlightLayer {
    CALayer *highlightLayer = [CALayer layer];
    self.highlightLayer = highlightLayer;
    highlightLayer.backgroundColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:0.75].CGColor;
    highlightLayer.frame = self.layer.bounds;
    highlightLayer.hidden = YES;
    [self.layer insertSublayer:highlightLayer below:self.shineLayer];
}


- (void)setHighlighted:(BOOL)highlight {
    self.highlightLayer.hidden = !highlight;
    [super setHighlighted:highlight];
}


@end
