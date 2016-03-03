//
//  FCTwitterManager.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to authenticate Twitter users.
//

#import <Foundation/Foundation.h>
#import "FCUtils.h"



@interface FCTwitterManager : NSObject


/**
 This method wil authenticate the logged in user with Twitter.
 
 Example usage:
 @code
 [FCSocialConnectManager getTwitterAuthTokenWithConsumerKey:@"345sdads" andSecretKey:@"asdfdssdfsfds" andCompletionHandler:^(BOOL success, id response, NSError *error)
 {
 }];
 @endcode
 
 @param consumerKey 
 This value is provided by Twitter developer site specific to this app.
 @param secretKey
  This value is provided by Twitter developer site specific to this app.
 @param callback
 The block representation that returns the authentication toaken or error content.
 */
+(void)getTwitterAuthTokenWithConsumerKey:(NSString *) consumerKey andSecretKey:(NSString *) secretKey andCompletionHandler:(FCCompletionBlock) callback;
@end
