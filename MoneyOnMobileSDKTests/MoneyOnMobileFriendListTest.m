//
//  MoneyOnMobileFriendListTest.m
//  MoneyOnMobileSDK
//
//  Created by Fastacash on 10/2/16.
//  Copyright © 2016 Fastacash. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FCFriendListManager.h"
#import "FCConstants.h"
#import "FCSocialFriend.h"

@interface MoneyOnMobileFriendListTest : XCTestCase

@end

@implementation MoneyOnMobileFriendListTest

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


- (void)testFetchFriendListForSupportingChannelWhatsapp {
    
    [FCFriendListManager fetchFriendListWithType:WHATSAPP andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
#if TARGET_IPHONE_SIMULATOR
        //Simulator will return "NO" as cannot install the apps
        XCTAssertFalse(success);
#else
        // Whatsapp channel should be able to fetch friend list
        XCTAssertTrue(success);
#endif
    }];
}

- (void)testFetchFriendListForSupportingChannelLine {
    
    [FCFriendListManager fetchFriendListWithType:LINE andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
#if TARGET_IPHONE_SIMULATOR
        //Simulator will return "NO" as cannot install the apps
        XCTAssertFalse(success);
#else
        // Line channel should be able to fetch friend list
        XCTAssertTrue(success);
#endif
    }];
}

- (void)testFetchFriendListForSupportingChannelViber {
    
    [FCFriendListManager fetchFriendListWithType:VIBER andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
#if TARGET_IPHONE_SIMULATOR
        //Simulator will return "NO" as cannot install the apps
        XCTAssertFalse(success);
#else
        // Viber channel should be able to fetch friend list
        XCTAssertTrue(success);
#endif
    }];
}

- (void)testFetchFriendListForSupportingChannelGooglePlus {
    
    [FCFriendListManager fetchFriendListWithType:GOOGLE_PLUS andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        //GooglePlus channel should return false
        XCTAssertFalse(success);
    }];
}

- (void)testFetchFriendListForSupportingChannelHike {
    
    [FCFriendListManager fetchFriendListWithType:HIKE andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
#if TARGET_IPHONE_SIMULATOR
        //Simulator will return "NO" as cannot install the apps
        XCTAssertFalse(success);
#else
        // Hike channel should be able to fetch friend list
        XCTAssertTrue(success);
#endif
    }];
}

- (void)testFetchFriendListForSupportingChannelEmail {
    
    [FCFriendListManager fetchFriendListWithType:EMAIL andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        // Email channel should be able to fetch friend list
        XCTAssertTrue(success);
    }];
}

- (void)testFetchFriendListForSupportingChannelSMS {
    
    [FCFriendListManager fetchFriendListWithType:SMS andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        // SMS channel should be able to fetch friend list
        XCTAssertTrue(success);
    }];
}

- (void)testFetchFriendListForNonSupportingChannelFacebook {
    
    [FCFriendListManager fetchFriendListWithType:FACEBOOK andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        //Facebook channel should return false
        XCTAssertFalse(success);
    }];
}

- (void)testFetchFriendListForNonSupportingChannelTwitter {
    
    [FCFriendListManager fetchFriendListWithType:TWITTER andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        //Twitter channel should return false
        XCTAssertFalse(success);
    }];
}

- (void)testFetchFriendListForSMS {
    
    [FCFriendListManager fetchFriendListWithType:SMS andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        //Check the type of the response object
        NSMutableArray *friendList = [[NSMutableArray alloc] init];
        XCTAssertEqualObjects([friendList class], [response class]);
        
        //Check the object type in the friend list array is of type FCSocialFriend
        for(id friendObject in response) {
            
            XCTAssertEqualObjects([FCSocialFriend class], [friendObject class]);
        }
    }];
    
}

- (void)testFetchFriendListForEmail {
    
    [FCFriendListManager fetchFriendListWithType:EMAIL andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        //Check the type of the response object
        NSMutableArray *friendList = [[NSMutableArray alloc] init];
        XCTAssertEqualObjects([friendList class], [response class]);
        
        for(id friendObject in response) {
            
            XCTAssertEqualObjects([FCSocialFriend class], [friendObject class]);
        }
    }];
    
}

- (void)testFetchFriendListForFacebook {
    
    [FCFriendListManager fetchFriendListWithType:FACEBOOK andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        //Fetch friendlist for the Facebook channel is not supported by the SDK. So the app should return false and the test case will check for the FALSE value.
        XCTAssertFalse(success);
    }];
    
}

- (void)testFetchFriendListForGooglePlus {
    
    [FCFriendListManager fetchFriendListWithType:GOOGLE_PLUS andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        //Fetch friendlist for the GooglePlus channel is not supported by the SDK. So the app should return false and the test case will check for the FALSE value.
        XCTAssertFalse(success);
    }];
    
}

- (void)testFetchFriendListForTwitter {
    
    [FCFriendListManager fetchFriendListWithType:TWITTER andCompletionHandler:^(BOOL success, id response, NSError *error) {
        
        //Fetch friendlist for the Twitter channel is not supported by the SDK. So the app should return false and the test case will check for the FALSE value.
        XCTAssertFalse(success);
    }];
    
}


@end
