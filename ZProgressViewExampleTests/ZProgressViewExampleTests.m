//
//  ZProgressViewExampleTests.m
//  ZProgressViewExampleTests
//
//  Created by Jai Govindani on 3/2/14.
//  Copyright (c) 2014 Zodio. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZProgressView.h"
#import "ZProgressViewStop.h"

@interface ZProgressViewExampleTests : XCTestCase

@property (strong ,nonatomic) ZProgressView *progressView;

@end

@implementation ZProgressViewExampleTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.progressView = [[ZProgressView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)progressViewShouldHaveNoStopsOnInit {
    XCTAssertEqual(self.progressView.stops.count, 0, @"No stops on init");
    XCTAssertEqual(self.progressView.subviews.count, 1, @"Only 1 subview - main progress view");
}

- (void)testAddingStop {
    
    XCTAssertEqualWithAccuracy(self.progressView.stops.count, 0, 0, @"No stops");
    XCTAssertEqualWithAccuracy(self.progressView.subviews.count, 1, 0, @"Only 1 subview");
    
    [self.progressView addStopAtPosition:0.5f];
    
    XCTAssertEqualWithAccuracy(self.progressView.stops.count, 1, 0, @"1 stop");
    XCTAssertEqualWithAccuracy(self.progressView.subviews.count, 2, 0, @"2 subviews");

    BOOL hasStopAtCorrectPosition = NO;
    CGFloat expectedPosition = floorf(self.progressView.frame.size.width * 0.5f);
    
    for (UIView *subview in self.progressView.subviews) {
        if (subview.frame.origin.x == expectedPosition) {
            hasStopAtCorrectPosition = YES;
        }
    }
    
    XCTAssertTrue(hasStopAtCorrectPosition, @"Has a stop at the correct position");
    
}

- (void)testAddingDuplicateStop {
    XCTAssertEqualWithAccuracy(self.progressView.stops.count, 0, 0, @"No stops");
    XCTAssertEqualWithAccuracy(self.progressView.subviews.count, 1, 0, @"Only 1 subview");
    
    [self.progressView addStopAtPosition:0.5f];
    
    XCTAssertEqualWithAccuracy(self.progressView.stops.count, 1, 0, @"1 stop");
    XCTAssertEqualWithAccuracy(self.progressView.subviews.count, 2, 0, @"2 subviews");
    
    BOOL hasStopAtCorrectPosition = NO;
    CGFloat expectedPosition = floorf(self.progressView.frame.size.width * 0.5f);
    
    for (UIView *subview in self.progressView.subviews) {
        if (subview.frame.origin.x == expectedPosition) {
            hasStopAtCorrectPosition = YES;
        }
    }
    
    XCTAssertTrue(hasStopAtCorrectPosition, @"Has a stop at the correct position");
    
    [self.progressView addStopAtPosition:0.5f];
    
    XCTAssertEqualWithAccuracy(self.progressView.stops.count, 1, 0, @"1 stop");
    XCTAssertEqualWithAccuracy(self.progressView.subviews.count, 2, 0, @"2 subviews");
    
    hasStopAtCorrectPosition = NO;
    expectedPosition = floorf(self.progressView.frame.size.width * 0.5f);
    
    for (UIView *subview in self.progressView.subviews) {
        if (subview.frame.origin.x == expectedPosition) {
            hasStopAtCorrectPosition = YES;
        }
    }
}

- (void)testRemovingStop {
    XCTAssertEqualWithAccuracy(self.progressView.stops.count, 0, 0, @"No stops");
    XCTAssertEqualWithAccuracy(self.progressView.subviews.count, 1, 0, @"Only 1 subview");
    
    [self.progressView addStopAtPosition:0.5f];
    
    XCTAssertEqualWithAccuracy(self.progressView.stops.count, 1, 0, @"1 stop");
    XCTAssertEqualWithAccuracy(self.progressView.subviews.count, 2, 0, @"2 subviews");
    
    BOOL hasStopAtCorrectPosition = NO;
    CGFloat expectedPosition = floorf(self.progressView.frame.size.width * 0.5f);
    
    for (UIView *subview in self.progressView.subviews) {
        if (subview.frame.origin.x == expectedPosition) {
            hasStopAtCorrectPosition = YES;
        }
    }
    
    XCTAssertTrue(hasStopAtCorrectPosition, @"Has a stop at the correct position");
    
    [self.progressView removeStopAtPosition:0.5f];
    
    XCTAssertEqualWithAccuracy(self.progressView.stops.count, 0, 0, @"No stops");
    XCTAssertEqualWithAccuracy(self.progressView.subviews.count, 1, 0, @"Only 1 subview");
}


@end
