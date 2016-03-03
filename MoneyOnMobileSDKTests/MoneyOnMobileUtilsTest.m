//
//  MoneyOnMobileUtilsTest.m
//  MoneyOnMobileSDK
//
//  Created by Fastacash on 22/2/16.
//  Copyright © 2016 Fastacash. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FCUtils.h"

@interface MoneyOnMobileUtilsTest : XCTestCase

@end

@implementation MoneyOnMobileUtilsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testURLSchemeStringWhatsapp {
    
    NSString *urlSchemeString = @"whatsapp://";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:WHATSAPP]);
}

- (void)testURLSchemeStringViber {
    
    NSString *urlSchemeString = @"viber://";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:VIBER]);
}

- (void)testURLSchemeStringLine {
    
    NSString *urlSchemeString = @"line://";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:LINE]);
}

- (void)testURLSchemeStringFacebook {
    
    NSString *urlSchemeString = @"fb://";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:FACEBOOK]);
}

- (void)testURLSchemeStringTwitter {
    
    NSString *urlSchemeString = @"twitter://";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:TWITTER]);
}

- (void)testURLSchemeStringGooglePlus {
    
    NSString *urlSchemeString = @"gplus://";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:GOOGLE_PLUS]);
}

- (void)testURLSchemeStringSMS {
    
    NSString *urlSchemeString = @"";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:SMS]);
}

- (void)testURLSchemeStringEmail {
    
    NSString *urlSchemeString = @"";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:EMAIL]);
}

- (void)testURLSchemeStringHike {
    
    NSString *urlSchemeString = @"combsbhike://";
    
    XCTAssertEqualObjects(urlSchemeString, [FCUtils getURLSchemeString:HIKE]);
}

@end
