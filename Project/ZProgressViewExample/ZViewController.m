//
//  ZViewController.m
//  ZProgressViewExample
//
//  Created by Jai Govindani on 3/2/14.
//  Copyright (c) 2014 Zodio. All rights reserved.
//

#import "ZViewController.h"
#import "ZProgressView.h"

@interface ZViewController ()

@end

@implementation ZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    ZProgressView *tempProgressView = [[ZProgressView alloc] initWithFrame:CGRectMake(60, 40, 200, 40)];
//    [self.view addSubview:tempProgressView];
//    self.progressView = tempProgressView;
    
    UIColor *defaultColor = [UIColor colorWithRed:230/255.0 green:126/255.0 blue:34/255.0 alpha:1.0f];
    self.progressView.progressBarColor = defaultColor;
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    [defaultColor getRed:&red green:&green blue:&blue alpha:0];
    
    self.redColorComponentTextField.text = [NSString stringWithFormat:@"%f", red];
    self.greenColorComponentTextField.text = [NSString stringWithFormat:@"%f", green];
    self.blueColorComponentTextField.text = [NSString stringWithFormat:@"%f", blue];
    
    //rgba(230, 126, 34,1.0)
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)setProgressButtonTapped:(id)sender {
    
    CGFloat progress = 0;
    if (self.progressTextField.text.length) {
        progress = [self.progressTextField.text floatValue];
    }
    
    if (progress >= 0.f && progress <= 1.f) {
        [self.progressView setProgress:progress animated:YES];
    }
}

- (IBAction)addStopButtonTapped:(id)sender {
    
    if (self.stopTextField.text.length) {
        CGFloat stopPosition = [self.stopTextField.text floatValue];
        
        if (stopPosition > 0 && stopPosition < 1) {
            [self.progressView addStopAtPosition:stopPosition];
        }
    }
}

- (IBAction)colorComponentTextFieldValueChanged:(id)sender {
    
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    
    [self.progressView.progressBarColor getRed:&red green:&green blue:&blue alpha:0];
    
    UITextField *colorComponentTextField = (UITextField*)sender;
    CGFloat newColorValue = 0;
    if (colorComponentTextField.text.length) {
        newColorValue = [colorComponentTextField.text floatValue];
    }
    
    
    if (colorComponentTextField == self.redColorComponentTextField) {
        red = newColorValue;
    } else if(colorComponentTextField == self.greenColorComponentTextField) {
        green = newColorValue;
    } else if (colorComponentTextField == self.blueColorComponentTextField) {
        blue = newColorValue;
    }
    
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
    [self.progressView setProgressBarColor:newColor];
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)removeAllStopsButtonTapped:(id)sender {
    [self.progressView removeAllStops];
}

- (IBAction)toggleStopVisibilityButtonTapped:(id)sender {
    self.progressView.showStops = !self.progressView.showStops;
}
@end
