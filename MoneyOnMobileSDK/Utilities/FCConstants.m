//
//  FCConstants.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Defines the enum and constant variables.
//

#import "FCConstants.h"

NSString * const cErrorDomain = @"com.fastacash.momsdk";

NSString * const cURLSchemeWhatsapp = @"whatsapp://";
NSString * const cURLSchemeViber = @"viber://";
NSString * const cURLSchemeLine = @"line://";
NSString * const cURLSchemeFacebook = @"fb://";
NSString * const cURLSchemeTwitter = @"twitter://";
NSString * const cURLSchemeGooglePlus = @"gplus://";
NSString * const cURLSchemeSMS = @"sms://";
NSString * const cURLSchemeEmail = @"mailto://";
NSString * const cURLSchemeHike = @"combsbhike://";

NSString * const cOpenURLSchemeGooglePlus = @"com.googleusercontent.apps";
NSString * const cURLSchemeFormatWhatsapp = @"whatsapp://send?text=%@";
NSString * const cURLSchemeFormatWhatsappWithContactId = @"whatsapp://send?text=%@&abid=%d";
NSString * const cURLSchemeFormatViber = @"viber://forward?text=%@";
NSString * const cURLSchemeFormatLine = @"line://msg/text/%@";
NSString * const cURLSchemeFormatHike = @"combsbhike://%@";
NSString * const cURLSchemeFormatGooglePlus = @"https://plus.google.com/share";
// fb-messenger

NSString * const cFCShortFacebook = @"fb";
NSString * const cFCShortTwitter = @"twitter";
NSString * const cFCShortGooglePlus = @"gplus";

// Channel name and channel image name 
NSString * const cWhatsapp = @"whatsapp";
NSString * const cLine = @"line";
NSString * const cHike = @"hike";
NSString * const cViber = @"viber";
NSString * const cMobile = @"mobile";
NSString * const cEmail = @"email";
NSString * const cFacebook = @"fb";
NSString * const cTwitter = @"twitter";
NSString * const cGooglePlus = @"googleplus";

#pragma mark Dictionary Key
NSString * const kPermissionSet = @"permissionSet";
NSString * const kAuthToken = @"authToken";
NSString * const kAuthSecretToken = @"authTokenSecret";
NSString * const kUserId = @"userID";

/*
 FCErrorExceptionOccurred=99,
 FCOperationSuccess = 100,
 FCErrorCancelledOperation=101,
 FCErrorUnsupportedChannel=102,
 FCErrorAppNotInstalled=103,
 FCErrorInvalidPermissionContacts=104,
 FCErrorDeniedPermission=105,
 FCErrorNoDataFound=106,
 FCErrorInvalidInput=107,
 FCErrorInvalidURLScheme=108,
 FCErrorUnableToOpenApp=109*/
NSString * const kFCErrorDefault = @"Unknown error occurred.";
NSString * const kFCError99 = @"Exception occurred.";
NSString * const kFCError100 = @"Operation success";
NSString * const kFCError101 = @"User cancelled the operation";
NSString * const kFCError102 = @"SDK does not support the specified social channel";
NSString * const kFCError103 = @"Social channel application is not installed on this device";
NSString * const kFCError104 = @"User dont have permission to access contacts";
NSString * const kFCError105 = @"Denied permissions.";
NSString * const kFCError106 = @"No data found";
NSString * const kFCError107 = @"Invalid permissions given in input";
NSString * const kFCError108 = @"Unable to open app";

