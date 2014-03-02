//
//  ZViewController.h
//  ZProgressViewExample
//
//  Created by Jai Govindani on 3/2/14.
//  Copyright (c) 2014 Zodio. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZProgressView;

@interface ZViewController : UIViewController

@property (weak, nonatomic) IBOutlet ZProgressView *progressView;
@property (weak, nonatomic) IBOutlet UITextField *redColorComponentTextField;
@property (weak, nonatomic) IBOutlet UITextField *greenColorComponentTextField;
@property (weak, nonatomic) IBOutlet UITextField *blueColorComponentTextField;
@property (weak, nonatomic) IBOutlet UITextField *progressTextField;
@property (weak, nonatomic) IBOutlet UITextField *stopTextField;

- (IBAction)setProgressButtonTapped:(id)sender;
- (IBAction)addStopButtonTapped:(id)sender;
- (IBAction)colorComponentTextFieldValueChanged:(id)sender;
- (IBAction)backgroundTapped:(id)sender;
- (IBAction)removeAllStopsButtonTapped:(id)sender;
- (IBAction)toggleStopVisibilityButtonTapped:(id)sender;


@end
