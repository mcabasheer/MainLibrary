//
//  FCUser.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Defines the FC User properties and methods.
//

#import <Foundation/Foundation.h>
#import "FCConstants.h"
#import "FCSocialChannel.h"

@interface FCUser : NSObject
@property(nonatomic, readonly) NSString* FCUID;
@property(nonatomic, strong) NSString* WUID;
@property(nonatomic, strong) NSString* profileName;
@property(nonatomic, strong) NSString* profileImageURL;
@property(nonatomic, strong) NSMutableDictionary *socials;

/**
 This method wil initialize the FCUser object.
 
 Example usage:
 @code
 FCUser *user = [ [FCUser alloc] init];
 @endcode
 */
- (instancetype) initFCUser;

/**
 This method wil add the social channel object to socials dictionary.
 
 Example usage:
 @code
 FCUser *user = [ [FCUser alloc] init];
 [user setSocialChannelWithID:@"whatsapp_" andChannelName:@"Whatsapp" andInvalidStatus:NO andChannelType:WHATSAPP];
 @endcode
 
 @param socialID
 The social id assigned to the channel
 @param channelName
 String representation of the channel name
 @param invalid
 Boolean value returned from server for the social channel
 @param channelType
 Enum value of the social channel
 */
-(void) setSocialChannelWithID:(NSString *) socialID andChannelName:(NSString *) channelName andInvalidStatus:(BOOL) invalid andChannelType:(FCSocialChannelType) channelType;

/**
 This method wil return the FCSocialChannel object if available in socials dictionary.
 
 Example usage:
 @code
  FCUser *user = [ [FCUser alloc] init];
  FCSocialChannel *whatsappChannel = [user getSocialChannelForKey:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
-(FCSocialChannel *) getSocialChannelForKey:(FCSocialChannelType) channelType;

/**
 This method wil check whether the specified social channel type is associated for the logged in user. It will return YES/NO.
 
 Example usage:
 @code
 FCUser *user = [ [FCUser alloc] init];
 BOOL isAssociated = [user isAssociatedForKey:WHATSAPP];
 @endcode
 
 @param channelType
 Enum value of the social channel
 */
-(BOOL) isAssociatedForKey:(FCSocialChannelType) channelType;


@end
