//
//  FCGooglePlusManager.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to authenticate Google Plus users.
//

#import <Foundation/Foundation.h>
#import "FCUtils.h"
#import <UIKit/UIKit.h>


@interface FCGooglePlusManager : NSObject
{
    UIViewController *parentViewController;
    FCCompletionBlock gpCallback;
}

+ (instancetype)sharedInstance;

/**
 This method wil authenticate the logged in user with Google Plus.
 
 Example usage:
 @code
 [FCSocialConnectManager getGooglePlusAuthTokenWithClientKey:@"Client_Key" andCompletionHandler:^(BOOL success, id response, NSError *error)
 {
 }];
 @endcode
 
 @param clientKey
 Google Plus client key provided by Google.
 @param fromViewController
 The parent UIViewController, from where the call is made.
 @param callback
 The block representation that returns the friend list or error content.
 */


-(void) getGooglePlusAuthTokenWithClientKey:(NSString *) clientKey fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;

@end
