//
//  FCConstants.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Defines the enum and constant variables.
//

#import <Foundation/Foundation.h>




typedef enum {
    WHATSAPP=0,
    LINE=1,
    VIBER=2,
    GOOGLE_PLUS=3,
    HIKE=4,
    EMAIL=5,
    SMS=6,
    FACEBOOK=7,
    TWITTER=8
    
} FCSocialChannelType;

extern NSString * const cErrorDomain;

#pragma mark URL SCHEME
extern NSString * const cURLSchemeWhatsapp;
extern NSString * const cURLSchemeViber;
extern NSString * const cURLSchemeLine;
extern NSString * const cURLSchemeFacebook;
extern NSString * const cURLSchemeTwitter;
extern NSString * const cURLSchemeGooglePlus;
extern NSString * const cURLSchemeSMS;
extern NSString * const cURLSchemeEmail;
extern NSString * const cURLSchemeHike;

extern NSString * const cOpenURLSchemeGooglePlus;
extern NSString * const cURLSchemeFormatWhatsapp;
extern NSString * const cURLSchemeFormatWhatsappWithContactId;
extern NSString * const cURLSchemeFormatViber;
extern NSString * const cURLSchemeFormatLine;
extern NSString * const cURLSchemeFormatHike;
extern NSString * const cURLSchemeFormatGooglePlus;
#pragma mark SHORT NAME
extern NSString * const cFCShortFacebook;
extern NSString * const cFCShortTwitter;
extern NSString * const cFCShortGooglePlus;

#pragma mark String name for channel
extern NSString * const cWhatsapp;
extern NSString * const cLine;
extern NSString * const cHike;
extern NSString * const cViber;
extern NSString * const cMobile;
extern NSString * const cEmail;
extern NSString * const cFacebook;
extern NSString * const cTwitter;
extern NSString * const cGooglePlus;

#pragma mark Dictionary Key
extern NSString * const kPermissionSet;
extern NSString * const kAuthToken;
extern NSString * const kAuthSecretToken;
extern NSString * const kUserId;

#define mark ERROR CODES

typedef enum {
    FCErrorExceptionOccurred=99,
    FCOperationSuccess = 100,
    FCErrorCancelledOperation=101,
    FCErrorUnsupportedChannel=102,
    FCErrorAppNotInstalled=103,
    FCErrorInvalidPermissionContacts=104,
    FCErrorDeniedPermission=105,
    FCErrorNoDataFound=106,
    FCErrorInvalidInput=107,
    FCErrorUnableToOpenApp=108
} FCErrorType;

extern NSString * const kFCErrorDefault;
extern NSString * const kFCError99;
extern NSString * const kFCError100;
extern NSString * const kFCError101;
extern NSString * const kFCError102;
extern NSString * const kFCError103;
extern NSString * const kFCError104;
extern NSString * const kFCError105;
extern NSString * const kFCError106;
extern NSString * const kFCError107;
extern NSString * const kFCError108;
