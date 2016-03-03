//
//  FCFriendListManager.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to fetch friend list based on social channels.
//

#import <Foundation/Foundation.h>
#import "FCConstants.h"

@interface FCFriendListManager : NSObject
typedef void (^FCCompletionBlock)(BOOL success, id response, NSError *error);
/**
 This method wil return the friend list based on social channel type.
 
 Example usage:
 @code
 [FCFriendListManager fetchFriendListWithType:@"Whatsapp" andCompletionHandler:^(BOOL success, id response, NSError *error)
 {
 }];
 @endcode
 
 @param channelType
 Enum value of the social channel
 @param callback
 The block representation that returns the friend list or error content.
 */
+(void) fetchFriendListWithType:(FCSocialChannelType) channelType andCompletionHandler:(FCCompletionBlock) callback;


/**
 This method wil check whether the specified social channel type is available to fetch friends list on user device. It will return YES/NO.
 
 Example usage:
 @code
 [FCNotificationManager canFetchFriendList:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
+ (BOOL) canFetchFriendList:(FCSocialChannelType) channelType;
@end
