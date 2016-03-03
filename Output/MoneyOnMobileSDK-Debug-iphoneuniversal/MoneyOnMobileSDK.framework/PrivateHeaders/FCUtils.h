//
//  FCUtils.h
//  
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Contains utility methods required for this SDK.
//

#import <Foundation/Foundation.h>
#import "FCConstants.h"

@interface FCUtils : NSObject

/*
 FC Completion Block is responsible to return data to client app
 */
typedef void (^FCCompletionBlock)(BOOL success, id response, NSError *error);

/**
 This method wil check whether specific social channel is installed on device. Return YES/NO.
 
 Example usage:
 @code
[FCUtils isAppInstalledForType:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
+ (BOOL) isAppInstalledForType:(FCSocialChannelType) channelType;

/**
 This method wil check whether specific social channel is supported by FC SDK for fetching friends. Return YES/NO.
 
 Example usage:
 @code
 [FCUtils isAppSupportedForFetchFriendsWithType:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
+ (BOOL) isAppSupportedForFetchFriendsWithType:(FCSocialChannelType) channelType;

/**
 This method wil check whether specific social channel is supported by FC SDK for sending notifications.. Return YES/NO.
 
 Example usage:
 @code
 [FCUtils isAppSupportedForNotificationsWithType:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
+ (BOOL) isAppSupportedForNotificationsWithType:(FCSocialChannelType) channelType;

/**
 This method will open specified social channel application. Return YES/NO.
 
 Example usage:
 @code
 NSURL *url = [NSURL URLWithString:@"whatsapp://send?text=Hello"];
 [FCUtils openSocialURL:url];
 @endcode
 
 @param scheme
An NSURL object with contents.
 */
+ (BOOL) openSocialURL:(NSURL *) scheme;

/**
 This method will create a NSError based on FCError code.
 
 Example usage:
 @code
 [FCUtils getErrorForCode:FCErrorUnableToOpenApp];
 @endcode
 
 @param errorCode
 An FCError code enum value. Integer.
 */
+(NSError *) getErrorForCode:(FCErrorType) errorCode;

/**
 This method will return the string value for specifed social channel.
 
 Example usage:
 @code
 [FCUtils getStringForChannelType:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
+(NSString *) getStringForChannelType:(FCSocialChannelType) channelType;

/**
 This method will return the URL string value for specifed social channel.
 
 Example usage:
 @code
 [FCUtils getURLSchemeString:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
+(NSString *) getURLSchemeString:(FCSocialChannelType) channelType;

/**
 This method will return channel short name for the specifed social channel. This is required for FC server.
 
 Example usage:
 @code
 [FCUtils getChannelShortNameForType:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
+(NSString *) getChannelShortNameForType:(FCSocialChannelType) channelType;

/**
 This method will return an error message based on FCError code.
 
 Example usage:
 @code
 [FCUtils getErrorMessageForCode:FCErrorUnableToOpenApp];
 @endcode
 
 @param errorCode
 An FCError code enum value. Integer.
 */
+(NSString *) getErrorMessageForCode:(FCErrorType) errorCode;

/**
 This method will check for nil in NSString
 
 Example usage:
 @code
 [FCUtils checkStringForNull:@"string to check"];
 @endcode
 
 @param stringValue
 An NSString to check for nil.
 */
+(BOOL) checkStringForNull:(NSString *) stringValue;

/**
 This method will check for valid email address.
 
 Example usage:
 @code
 [FCUtils checkForValidEmail:@"a@b.com"];
 @endcode
 
 @param stringValue
 An NSString email address.
 */
+ (BOOL) checkForValidEmail:(NSString *) email;

@end
