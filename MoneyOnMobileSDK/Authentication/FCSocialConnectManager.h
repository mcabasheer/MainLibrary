//
//  FCSocialConnectManager.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to authenticate social channels.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface FCSocialConnectManager : NSObject
typedef void (^FCCompletionBlock)(BOOL success, id response, NSError *error);

+ (instancetype)sharedInstance;

/**
 This method wil authenticate the logged in user with Facebook.
 
 Example usage:
 @code
 [FCSocialConnectManager authenticateFacebookChannelWithPermissions:@[@"public_profile", @"email", @"user_friends"] fromViewController:fromViewController andCompletionHandler:^(BOOL success, id response, NSError *error)
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
-(void) authenticateFacebookWithPermissions:(NSArray *) permissions fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;

/**
 This method wil authenticate the logged in user with Twitter.
 
 Example usage:
 @code
 [FCSocialConnectManager authenticateTwitterChannelWithConsumerKey:@"GF34TGRDF" andSecretKey:@"34534FERFFRD" andCompletionHandler:^(BOOL success, id response, NSError *error)
 {
 }];
 @endcode
 
 @param consumerKey
 This value is provided by Twitter developer site specific to this app.
 @param secretKey
 This value is provided by Twitter developer site specific to this app.
 @param callback
 @param callback
 The block representation that returns the authentication toaken or error content.
 */
-(void)authenticateTwitterChannelWithConsumerKey:(NSString *) consumerKey andSecretKey:(NSString *) secretKey andCompletionHandler:(FCCompletionBlock) callback;



/**
 This method wil authenticate the logged in user with Google Plus.
 
 Example usage:
 @code
 [FCSocialConnectManager authenticateGooglePlusChannelWithClientKey:@"Client_Key" andCompletionHandler:^(BOOL success, id response, NSError *error)
 {
 }];
 @endcode
 
 @param clientKey
 Google Plus client key provided by Google.
 @param callback
 The block representation that returns the friend list or error content.
 */
-(void) authenticateGooglePlusChannelWithClientKey:(NSString *) clientKey fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;

@end
