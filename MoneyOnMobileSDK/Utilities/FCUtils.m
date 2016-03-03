//
//  FCUtils.m
//  
//
//  Created by Basheer Ahamed on 3/2/16.
//
//

#import "FCUtils.h"
#import "FCConstants.h"
#import <UIkit/UIKit.h>

#define FC_ERROR_KEY(code)                    [NSString stringWithFormat:@"%d", code]
#define FC_ERROR_LOCALIZED_DESCRIPTION(code)  NSLocalizedStringFromTable(FC_ERROR_KEY(code), @"Errors", nil)
#define NSLocalizedString(key, comment) [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

@implementation FCUtils

+ (BOOL) isAppInstalledForType:(FCSocialChannelType) channelType;
{
    if (channelType == SMS || channelType == EMAIL) {
        return YES;
    }
    
    NSString *urlScheme = [FCUtils getURLSchemeString:channelType];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:urlScheme]]) {
        // Safe to launch the facebook app
        return YES;
    }
    return NO;
}

+ (BOOL) openSocialURL:(NSURL *) url;
{
    return [[UIApplication sharedApplication] openURL:url];
}

+(NSString *) getURLSchemeString:(FCSocialChannelType) channelType;
{
    NSString *scheme = @"";
    switch (channelType) {
        case WHATSAPP:
            scheme = cURLSchemeWhatsapp;
            break;
        case LINE:
            scheme = cURLSchemeLine;
            break;
        case VIBER:
            scheme = cURLSchemeViber;
            break;
        case GOOGLE_PLUS:
            scheme = cURLSchemeGooglePlus;
            break;
        case HIKE:
            scheme = cURLSchemeHike;
            break;
        default:
            scheme = @"";
            break;
    }
    return scheme;
    
}

+(NSString *) getStringForChannelType:(FCSocialChannelType) channelType;
{
    NSString *scheme = @"";
    switch (channelType) {
        case WHATSAPP:
            scheme = cWhatsapp;
            break;
        case LINE:
            scheme = cLine;
            break;
        case VIBER:
            scheme = cViber;
            break;
        case GOOGLE_PLUS:
            scheme = cGooglePlus;
            break;
        case HIKE:
            scheme = cHike;
            break;
        case FACEBOOK:
            scheme = cFacebook;
            break;
        case TWITTER:
            scheme = cTwitter;
            break;
        default:
            scheme = @"";
            break;
    }
    return scheme;
}

+(NSString *) getChannelShortNameForType:(FCSocialChannelType) channelType;
{
    NSString *scheme = @"";
    switch (channelType) {
        case WHATSAPP:
            scheme = cWhatsapp;
            break;
        case LINE:
            scheme = cLine;
            break;
        case VIBER:
            scheme = cViber;
            break;
        case GOOGLE_PLUS:
            scheme = cFCShortGooglePlus;
            break;
        case HIKE:
            scheme = cHike;
            break;
        case FACEBOOK:
            scheme = cFCShortFacebook;
            break;
        case TWITTER:
            scheme = cFCShortTwitter;
            break;
        default:
            scheme = @"";
            break;
    }
    return scheme;
}


+ (BOOL) isAppSupportedForFetchFriendsWithType:(FCSocialChannelType) channelType;
{
    BOOL response = NO;
    switch (channelType) {
        case WHATSAPP:
        case LINE:
        case VIBER:
        case HIKE:
        case SMS:
        case EMAIL:
            response = YES;
            break;
        default:
            response = NO;
            break;
    }
    return response;
}

+ (BOOL) isAppSupportedForNotificationsWithType:(FCSocialChannelType) channelType;
{
    BOOL response = NO;
    switch (channelType) {
        case WHATSAPP:
        case LINE:
        case VIBER:
        case HIKE:
        case GOOGLE_PLUS:
            response = YES;
            break;
        default:
            response = NO;
            break;
    }
    return  response;
}

+(NSError *) getErrorForCode:(FCErrorType) errorCode;
{
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: [FCUtils getErrorMessageForCode:errorCode]
                               };
    NSLog(@"Error description : <%@>", userInfo);

    NSError *error = [NSError errorWithDomain:cErrorDomain code:errorCode userInfo:userInfo];
    return error;
}

+(NSString *) getErrorMessageForCode:(FCErrorType) errorCode
{
    NSString *message = nil;
    switch (errorCode) {
        case 99:
            message = kFCError99;
            break;
        case 100:
            message = kFCError100;
            break;
        case 101:
            message = kFCError101;
            break;
        case 102:
            message = kFCError102;
            break;
        case 103:
            message = kFCError103;
            break;
        case 104:
            message = kFCError104;
            break;
        case 105:
            message = kFCError105;
            break;
        case 106:
            message = kFCError106;
            break;
        case 107:
            message = kFCError107;
            break;
        case 108:
            message = kFCError108;
            break;
        default:
            message = kFCErrorDefault;
            break;
    }
    return message;
}

+(BOOL) checkStringForNull:(NSString *) stringValue;
{
    if (stringValue != nil && stringValue != (id)[NSNull null] && ![stringValue isEqualToString:@"(null)"])
    {
        return YES;
    }else
    {
        return NO;
    }
}

+ (BOOL) checkForValidEmail:(NSString *) email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
@end
