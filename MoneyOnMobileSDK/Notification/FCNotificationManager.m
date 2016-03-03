//
//  FCNotificationManager.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to share notification to social channels.
//

#import "FCNotificationManager.h"
#import "FCUtils.h"

@implementation FCNotificationManager

+ (BOOL) canNotify:(FCSocialChannelType) channelType;
{
    BOOL isAppSupported = [FCUtils isAppSupportedForNotificationsWithType:channelType];
    return isAppSupported;
}

+(NSError *) shareText:(NSString *) message andType:(FCSocialChannelType) channelType andContactID:(int) contactID;
{
    // if message is empty, return error message
    if ([FCUtils checkStringForNull:message] == NO) {
        return [FCUtils getErrorForCode:FCErrorInvalidInput];
    }
    
    // check whether the channel is supported by sdk
    if ([FCNotificationManager canNotify:channelType] == NO) {
        return [FCUtils getErrorForCode:FCErrorUnsupportedChannel];
    }
    
    // check whether the channel is installed on device
    BOOL isAppInstalled = [FCUtils isAppInstalledForType:channelType];
    if (isAppInstalled == NO) {
        // channel not installed on device
        return [FCUtils getErrorForCode:FCErrorAppNotInstalled];
    }
    
    
    // get the url scheme and open the app
    NSString *scheme = [FCUtils getURLSchemeString:channelType];
    if ([scheme isEqualToString:@""]) {
        // channel not installed on device
        return  [FCUtils getErrorForCode:FCErrorUnableToOpenApp];
    }
    
    NSURL* url = [self getCustomURLForChannel:channelType andMessage:message andContactId:contactID];
    
    if ([FCUtils openSocialURL:url] == NO) {
        // error occurred while opening the app
        return [FCUtils getErrorForCode:FCErrorUnableToOpenApp];
    }
    else
    {
        // if successful, return nil for error
        return nil;
    }
   
}

+ (NSURL *) getCustomURLForChannel: (FCSocialChannelType) channelType andMessage:(NSString *) message andContactId:(int) contactid
{
    NSURL* url  = nil;
    NSURLComponents* urlComponents = nil;
    NSString *urlString = nil;
    
    switch (channelType) {
        case WHATSAPP:
        {
            if (contactid > 0) {
                urlString = [NSString stringWithFormat:cURLSchemeFormatWhatsappWithContactId, message, contactid];
            }
            else
            {
                urlString = [NSString stringWithFormat:cURLSchemeFormatWhatsapp, message];
            }
            url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            
        }
            break;
        case LINE:
        {
            urlString = [NSString stringWithFormat:cURLSchemeFormatLine, message];
            url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
            break;
        case VIBER:
        {
            urlString = [NSString stringWithFormat:cURLSchemeFormatViber, message];
            url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
            break;
        case HIKE:
        {
            urlString = [NSString stringWithFormat:cURLSchemeFormatHike, message];
            url = [NSURL URLWithString:[urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
            break;
        case GOOGLE_PLUS:
        {
            urlString = cURLSchemeFormatGooglePlus;
            urlComponents = [[NSURLComponents alloc]
                             initWithString:urlString];
            
            urlComponents.queryItems = @[[[NSURLQueryItem alloc]
                                          initWithName:@"text"
                                          value:message]];
            url = [urlComponents URL];
        }
            break;
            
        default:
            break;
    }

    return url;
}

@end
