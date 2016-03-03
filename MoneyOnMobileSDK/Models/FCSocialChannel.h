//
//  FCSocialChannel.h
//  
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Defines the Social channel properties and methods.
//

#import <Foundation/Foundation.h>
#import "FCConstants.h"

@interface FCSocialChannel : NSObject

@property(nonatomic, readonly) NSString* shortName;
@property(nonatomic, strong) NSString* channelName;
@property(nonatomic, strong) NSString* channelImageName;
@property(nonatomic, strong) NSString* socialID;
@property(nonatomic) BOOL isAssociated;
@property(nonatomic) BOOL isInvalid;
@property (nonatomic) FCSocialChannelType channelType;


/**
 This method wil initialize the FCSocialChannel object.
 
 Example usage:
 @code
 FCSocialChannel *whatsappChannel = [ [FCSocialChannel alloc] initWithSocialID:@"whatsapp_" andChannelName:@"Whatsapp" andInvalidStatus:NO andChannelType:WHATSAPP];
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
-(instancetype) initWithSocialID:(NSString *) socialID andChannelName:(NSString *) channelName andInvalidStatus:(BOOL) invalid andChannelType:(FCSocialChannelType) channelType;

@end
