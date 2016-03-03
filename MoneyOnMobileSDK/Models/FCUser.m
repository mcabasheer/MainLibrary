//
//  FCUser.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Defines the FC User properties and methods.
//

#import "FCUser.h"
#import "FCSocialChannel.h"
#import "FCUtils.h"

@implementation FCUser
@synthesize socials, FCUID, WUID, profileImageURL, profileName;
- (instancetype) initFCUser;
{
    return self;
}

-(void) setSocialChannelWithID:(NSString *) socialID andChannelName:(NSString *) channelName andInvalidStatus:(BOOL) invalid andChannelType:(FCSocialChannelType) channelType;
{
    if ([FCUtils checkStringForNull:socialID] == YES) {
        FCSocialChannel *socialChannel = [[FCSocialChannel alloc] initWithSocialID:socialID!=nil?socialID:@"" andChannelName:channelName!=nil?channelName:@"" andInvalidStatus:invalid andChannelType:channelType];
        
        // Associated should be YES
        socialChannel.isAssociated = YES;
        
        [self.socials setObject:socialChannel forKey:[FCUtils getStringForChannelType:channelType]];
    }
}

-(FCSocialChannel *) getSocialChannelForKey:(FCSocialChannelType) channelType;
{
    return [self.socials objectForKey:[FCUtils getStringForChannelType:channelType]];
}

-(BOOL) isAssociatedForKey:(FCSocialChannelType) channelType;
{
    if ([self getSocialChannelForKey:channelType] == nil) 
        return NO;
    else
        return YES;
}

@end
