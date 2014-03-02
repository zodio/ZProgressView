//
//  ZProgressView.m
//  ZProgressViewExample
//
//  Created by Jai Govindani on 3/2/14.
//  Copyright (c) 2014 Zodio. All rights reserved.
//

#define STOP_TAG    100

#import "ZProgressView.h"
#import "ZProgressViewStop.h"

@interface ZProgressView ()

@property (strong, nonatomic) UIView *progressBarView;

@end

@implementation ZProgressView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [self setup];
}

- (void)setup {
    _progressBarView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:_progressBarView];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (NSMutableArray*)stops {
    if (!_stops) {
        _stops = [NSMutableArray array];
    }
    
    return _stops;
}

- (void)addStopAtPosition:(CGFloat)position {
    
    if (![self _stopExistsAtPosition:position]) {
        ZProgressViewStop *stopToAdd = [ZProgressViewStop stopAtPosition:position];
        [self.stops addObject:stopToAdd];
        [stopToAdd placeInProgressView:self];
    }

}

- (void)removeStopAtPosition:(CGFloat)position {
    
    if ([self _stopExistsAtPosition:position]) {
        ZProgressViewStop *stopToRemove;
        
        for (ZProgressViewStop *stop in self.stops) {
            if (stop.position == position) {
                stopToRemove = stop;
            }
        }
        
        [stopToRemove removeFromProgressView];
        [self.stops removeObject:stopToRemove];
    }
}

- (void)removeAllStops {
    for (ZProgressViewStop *stop in self.stops) {
        [stop removeFromProgressView];
    }
    
    [self.stops removeAllObjects];
}

- (void)setProgress:(CGFloat)progress {
    [self setProgress:progress animated:NO];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated {
    
    //Default is 0.5sec for entire bar
    //Find delta
    CGFloat progressDelta = fabsf(_progress - progress);
    NSTimeInterval animationDuration = 0.5 * progressDelta;
    
    _progress = progress;
    NSInteger progressBarWidth = floorf(progress * self.frame.size.width);
    CGRect progressBarFrame = CGRectMake(0, 0, progressBarWidth, self.frame.size.height);
    
    if (animated) {
        [UIView animateWithDuration:animationDuration animations:^{
            [_progressBarView setFrame:progressBarFrame];
        }];
    } else {
        [_progressBarView setFrame:progressBarFrame];
    }
}

- (void)setProgressBarColor:(UIColor *)progressBarColor {
    _progressBarColor = progressBarColor;
    [_progressBarView setBackgroundColor:_progressBarColor];
}

#pragma mark - Private

- (BOOL)_stopExistsAtPosition:(CGFloat)position {
    for (ZProgressViewStop *stop in self.stops) {
        if (stop.position == position) {
            return YES;
        }
    }
    
    return NO;
}

@end
