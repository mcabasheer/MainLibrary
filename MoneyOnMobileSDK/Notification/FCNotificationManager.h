//
//  FCNotificationManager.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to share notification to social channels.
//

#import <Foundation/Foundation.h>
#import "FCConstants.h"
@interface FCNotificationManager : NSObject



/**
 This method wil check whether the specified social channel type is available to send notification on user device. It will return YES/NO.
 
 Example usage:
 @code
 [FCNotificationManager canNotify:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
+ (BOOL) canNotify:(FCSocialChannelType) channelType;

/**
 This method wil check share the message to the specified social channel. If error occurred, it will be returned.
 
 Example usage:
 @code
 [FCNotificationManager shareText:@"Share this content" andType:WHATSAPP andContactID:@"123456"];
 @endcode
 
 @param message
 Text that needs to be shared
 @param channelType
 Enum value of the social channel
 @param contactID
 Address book id for the contact. This is optional.
 */
+(NSError *) shareText:(NSString *) message andType:(FCSocialChannelType) channelType andContactID:(int) contactID;

+ (NSURL *) getCustomURLForChannel: (FCSocialChannelType) channelType andMessage:(NSString *) message andContactId:(int) contactid;

@end
