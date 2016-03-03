//
//  MoneyOnMobileNotificationTest.m
//  MoneyOnMobileSDK
//
//  Created by Fastacash on 3/2/16.
//  Copyright © 2016 Fastacash. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FCNotificationManager.h"
#import "FCUtils.h"

@interface MoneyOnMobileNotificationTest : XCTestCase

@end

@implementation MoneyOnMobileNotificationTest

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

- (void)testCanNotifyWhatsapp {

    BOOL isAppSupported = [FCUtils isAppSupportedForNotificationsWithType:WHATSAPP];
    
    XCTAssertTrue(isAppSupported);
}

- (void)testCanNotifyLine {
    
    BOOL isAppSupported = [FCUtils isAppSupportedForNotificationsWithType:LINE];
    
    XCTAssertTrue(isAppSupported);
}

- (void)testCanNotifyViber {
    
    BOOL isAppSupported = [FCUtils isAppSupportedForNotificationsWithType:VIBER];
    
    XCTAssertTrue(isAppSupported);
}

- (void)testCanNotifyGooglePlus {
    
    BOOL isAppSupported = [FCUtils isAppSupportedForNotificationsWithType:GOOGLE_PLUS];
    
    XCTAssertTrue(isAppSupported);
}

- (void)testCanNotifyHike {
    
    BOOL isAppSupported = [FCUtils isAppSupportedForNotificationsWithType:HIKE];
    
    XCTAssertTrue(isAppSupported);
}

- (void)testCanNotifySMS {
    
    BOOL isAppSupported = [FCUtils isAppSupportedForNotificationsWithType:SMS];
    
    XCTAssertFalse(isAppSupported);
}

- (void)testCanNotifyEmail {
    
    BOOL isAppSupported = [FCUtils isAppSupportedForNotificationsWithType:EMAIL];
    
    XCTAssertFalse(isAppSupported);
}

- (void)testShareTextWithoutWhatsAppInstalled {
    
    BOOL canNotify = [FCNotificationManager canNotify:WHATSAPP];
    
    //Whatsapp is a supportted channel and should be validated to TRUE
    XCTAssertTrue(canNotify);
    
    //Check whether the app is installed on the device.
    BOOL isAppInstalled = [FCUtils isAppInstalledForType:WHATSAPP];
    
    //Simulator will return "NO" as cannot install the apps
    XCTAssertFalse(isAppInstalled);
    
    //Create the mock error data
    NSInteger errorCode = 103;
    NSString *errorMessage = @"Failed. Social channel application is not installed on this device";
    NSString *errorDomain = @"com.fastacash.momsdk";
    
    //Get the error object from the App
    NSError *appError = [FCNotificationManager shareText:@"Sample share text"
                                                 andType:WHATSAPP
                                            andContactID:10];
    
    //Check for the same error code for the application not installed.
    XCTAssertEqual(errorCode, appError.code);
    
    //Check for the same error domain for the application not installed.
    XCTAssertEqualObjects(errorDomain, appError.domain);
    
    //Check for the same error message for the application not installed.
    XCTAssertEqualObjects(errorMessage, appError.description);
}

- (void)testShareTextWithoutLineInstalled {
    
    BOOL canNotify = [FCNotificationManager canNotify:LINE];
    
    //LINE is a supportted channel and should be validated to TRUE
    XCTAssertTrue(canNotify);
    
    //Check whether the app is installed on the device.
    BOOL isAppInstalled = [FCUtils isAppInstalledForType:LINE];
    
    //Simulator will return "NO" as cannot install the apps
    XCTAssertFalse(isAppInstalled);
    
    //Create the mock error data
    NSInteger errorCode = 103;
    NSString *errorMessage = @"Failed. Social channel application is not installed on this device";
    NSString *errorDomain = @"com.fastacash.momsdk";
    
    //Get the error object from the App
    NSError *appError = [FCNotificationManager shareText:@"Sample share text"
                                                 andType:LINE
                                            andContactID:10];
    
    //Check for the same error code for the application not installed.
    XCTAssertEqual(errorCode, appError.code);
    
    //Check for the same error domain for the application not installed.
    XCTAssertEqualObjects(errorDomain, appError.domain);
    
    //Check for the same error message for the application not installed.
    XCTAssertEqualObjects(errorMessage, appError.description);
}

- (void)testShareTextWithoutViberInstalled {
    
    BOOL canNotify = [FCNotificationManager canNotify:VIBER];
    
    //VIBER is a supportted channel and should be validated to TRUE
    XCTAssertTrue(canNotify);
    
    //Check whether the app is installed on the device.
    BOOL isAppInstalled = [FCUtils isAppInstalledForType:VIBER];
    
    //Simulator will return "NO" as cannot install the apps
    XCTAssertFalse(isAppInstalled);
    
    //Create the mock error data
    NSInteger errorCode = 103;
    NSString *errorMessage = @"Failed. Social channel application is not installed on this device";
    NSString *errorDomain = @"com.fastacash.momsdk";
    
    //Get the error object from the App
    NSError *appError = [FCNotificationManager shareText:@"Sample share text"
                                                 andType:VIBER
                                            andContactID:10];
    
    //Check for the same error code for the application not installed.
    XCTAssertEqual(errorCode, appError.code);
    
    //Check for the same error domain for the application not installed.
    XCTAssertEqualObjects(errorDomain, appError.domain);
    
    //Check for the same error message for the application not installed.
    XCTAssertEqualObjects(errorMessage, appError.description);
}

- (void)testShareTextWithoutGooglePlusInstalled {
    
    BOOL canNotify = [FCNotificationManager canNotify:GOOGLE_PLUS];
    
    //GOOGLE_PLUS is a supportted channel and should be validated to TRUE
    XCTAssertTrue(canNotify);
    
    //Check whether the app is installed on the device.
    BOOL isAppInstalled = [FCUtils isAppInstalledForType:GOOGLE_PLUS];
    
    //Simulator will return "NO" as cannot install the apps
    XCTAssertFalse(isAppInstalled);
    
    //Create the mock error data
    NSInteger errorCode = 103;
    NSString *errorMessage = @"Failed. Social channel application is not installed on this device";
    NSString *errorDomain = @"com.fastacash.momsdk";
    
    //Get the error object from the App
    NSError *appError = [FCNotificationManager shareText:@"Sample share text"
                                                 andType:GOOGLE_PLUS
                                            andContactID:10];
    
    //Check for the same error code for the application not installed.
    XCTAssertEqual(errorCode, appError.code);
    
    //Check for the same error domain for the application not installed.
    XCTAssertEqualObjects(errorDomain, appError.domain);
    
    //Check for the same error message for the application not installed.
    XCTAssertEqualObjects(errorMessage, appError.description);
}

- (void)testShareTextWithoutHikeInstalled {
    
    BOOL canNotify = [FCNotificationManager canNotify:HIKE];
    
    //HIKE is a supportted channel and should be validated to TRUE
    XCTAssertTrue(canNotify);
    
    //Check whether the app is installed on the device.
    BOOL isAppInstalled = [FCUtils isAppInstalledForType:HIKE];
    
    //Simulator will return "NO" as cannot install the apps
    XCTAssertFalse(isAppInstalled);
    
    //Create the mock error data
    NSInteger errorCode = 103;
    NSString *errorMessage = @"Failed. Social channel application is not installed on this device";
    NSString *errorDomain = @"com.fastacash.momsdk";
    
    //Get the error object from the App
    NSError *appError = [FCNotificationManager shareText:@"Sample share text"
                                                 andType:HIKE
                                            andContactID:10];
    
    //Check for the same error code for the application not installed.
    XCTAssertEqual(errorCode, appError.code);
    
    //Check for the same error domain for the application not installed.
    XCTAssertEqualObjects(errorDomain, appError.domain);
    
    //Check for the same error message for the application not installed.
    XCTAssertEqualObjects(errorMessage, appError.description);
}

- (void)testGetCustomURLForChannelWhatsapp {
    
    //Create the mock data
    NSString *whatsappURLScheme = @"whatsapp://send?text=This is a sample message&abid=10";
    
    //URL encode the mock data
    NSURL *whatsappCustomURLScheme = [NSURL URLWithString:[whatsappURLScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //Get the URL scheme for WHATSAPP from the SDK code
    NSURL *appURLScheme = [FCNotificationManager getCustomURLForChannel:WHATSAPP andMessage:@"This is a sample message" andContactId:10];
    
    //Compare the URL objects
    XCTAssertEqualObjects(whatsappCustomURLScheme, appURLScheme);
}

- (void)testGetCustomURLForChannelLine {
    
    //Create the mock data
    NSString *lineURLScheme = @"line://msg/text/This is a sample message";
    
    //URL encode the mock data
    NSURL *lineCustomURLScheme = [NSURL URLWithString:[lineURLScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //Get the URL scheme for LINE from the SDK code
    NSURL *appURLScheme = [FCNotificationManager getCustomURLForChannel:LINE andMessage:@"This is a sample message" andContactId:10];
    
    //Compare the URL objects
    XCTAssertEqualObjects(lineCustomURLScheme, appURLScheme);
}

- (void)testGetCustomURLForChannelViber {
    
    //Create the mock data
    NSString *viberURLScheme = @"viber://forward?text=This is a sample message";
    
    //URL encode the mock data
    NSURL *viberCustomURLScheme = [NSURL URLWithString:[viberURLScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //Get the URL scheme for VIBER from the SDK code
    NSURL *appURLScheme = [FCNotificationManager getCustomURLForChannel:VIBER andMessage:@"This is a sample message" andContactId:10];
    
    //Compare the URL objects
    XCTAssertEqualObjects(viberCustomURLScheme, appURLScheme);
}

- (void)testGetCustomURLForChannelGooglePlus {
    
    //Create the mock data
    NSString *googleplusURLScheme = @"https://plus.google.com/share?text=This is a sample message";
    
    //URL encode the mock data
    NSURL *googleplusCustomURLScheme = [NSURL URLWithString:[googleplusURLScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //Get the URL scheme for GOOGLE PLUS from the SDK code
    NSURL *appURLScheme = [FCNotificationManager getCustomURLForChannel:GOOGLE_PLUS andMessage:@"This is a sample message" andContactId:10];
    
    //Compare the URL objects
    XCTAssertEqualObjects(googleplusCustomURLScheme, appURLScheme);
}

- (void)testGetCustomURLForChannelHike {
    
    //Create the mock data
    NSString *hikeURLScheme = @"combsbhike://This is a sample message";
    
    //URL encode the mock data
    NSURL *hikeCustomURLScheme = [NSURL URLWithString:[hikeURLScheme stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    //Get the URL scheme for HIKE from the SDK code
    NSURL *appURLScheme = [FCNotificationManager getCustomURLForChannel:HIKE andMessage:@"This is a sample message" andContactId:10];
    
    //Compare the URL objects
    XCTAssertEqualObjects(hikeCustomURLScheme, appURLScheme);
}

@end