//
//  FCFacebookManager.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to authenticate Facebook users.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FCUtils.h"

@interface FCFacebookManager : NSObject


/**
 This method wil authenticate the logged in user with Facebook.
 
 Example usage:
 @code
 [FCSocialConnectManager getFacebookAuthTokenWithPermissions:@[@"public_profile", @"email", @"user_friends"] fromViewController:fromViewController andCompletionHandler:^(BOOL success, id response, NSError *error)
 {
 }];
 @endcode
 
 @param permissions
 Array of permission type that is required for Facebook authentication.
 @param fromViewController
 The parent UIViewController, from where the call is made.
 @param callback
 The block representation that returns the authentication token or error content.
 */
+(void) getFacebookAuthTokenWithPermissions:(NSArray *) permissions fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;


+(void) getFacebookPublishAuthTokenWithPermissions:(NSArray *) permissions fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;
@end
