//
//  FCSocialChannel.m
//  
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Defines the Social channel properties and methods.
//


#import "FCSocialChannel.h"
#import "FCUtils.h"
/*
 @property(nonatomic, readonly) NSString* shortName;
 @property(nonatomic, strong) NSString* channelName;
 @property(nonatomic, strong) NSString* channelImageName;
 @property(nonatomic, strong) NSString* socialID;
 @property(nonatomic) BOOL isAssociated;
 @property(nonatomic) BOOL isInvalid;
 @property (nonatomic) FCSocialChannelType channelType;
 */
@implementation FCSocialChannel
@synthesize shortName, channelName, channelImageName, socialID, isAssociated, isInvalid, channelType;

-(instancetype) initWithSocialID:(NSString *) socialId andChannelName:(NSString *) channelname andInvalidStatus:(BOOL) invalid andChannelType:(FCSocialChannelType) channeltype;
{
    if (self == [super init]) {
        self.socialID = [FCUtils checkStringForNull:socialId] == YES?socialId:@"";
        self.channelName = [FCUtils checkStringForNull:channelname] == YES?channelname:@"";
        self.isInvalid = invalid;
        self.channelType = channeltype;
        // channel image name needs to be set by the developer if required. SDK will not initialise the property.
    }
    return self;
}

- (NSString *) shortName
{
    return [FCUtils getChannelShortNameForType:self.channelType];
}

@end
