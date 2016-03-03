//
//  FCFacebookManager.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to authenticate Facebook users.
//

#import "FCFacebookManager.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "FCConstants.h"
#import "FCUtils.h"

@implementation FCFacebookManager

+(void) getFacebookAuthTokenWithPermissions:(NSArray *) permissions fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;
{
    @try {
        // If read permissions are available, continue loading facebook authentication. Else return error.
        if (permissions.count > 0) {
            FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
            [login logOut];
            [login logInWithReadPermissions:permissions //@[@"public_profile", @"email", @"user_friends"]
                         fromViewController:fromViewController
                                    handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
             {
                 if (error) {
                     callback(NO, nil,error);
                 } else if (result.isCancelled) {
                     callback(NO, nil, [FCUtils getErrorForCode:FCErrorCancelledOperation]);
                 } else {
                     NSMutableDictionary *dictionary = [NSMutableDictionary new];
                     dictionary[kAuthToken] = result.token.tokenString;
                     dictionary[kUserId] = result.token.userID;
                     dictionary[kPermissionSet] = result.grantedPermissions;
                     callback(YES, dictionary,nil);
                 }
             }];
        }
        else
        {
            callback(NO, nil,[FCUtils getErrorForCode:FCErrorInvalidInput]);
        }
    }
    @catch (NSException *exception) {
        callback(NO, nil,[FCUtils getErrorForCode:FCErrorExceptionOccurred]);
    }
    @finally {
    }
}


+(void) getFacebookPublishAuthTokenWithPermissions:(NSArray *) permissions fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;
{
    @try {
        if (permissions.count > 0) {
            // call post publish
            FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
            [login logInWithPublishPermissions:permissions fromViewController:fromViewController handler:^(FBSDKLoginManagerLoginResult *result, NSError *error)
             {
                 
                 if (error) {
                     callback(NO, nil,error);
                 } else if (result.isCancelled) {
                     callback(NO, nil,[FCUtils getErrorForCode:FCErrorCancelledOperation]);
                 } else {
                     // call post publish
                     NSMutableDictionary *dictionary = [NSMutableDictionary new];
                     dictionary[kAuthToken] = result.token.tokenString;
                     dictionary[kUserId] = result.token.userID;
                     dictionary[kPermissionSet] = result.grantedPermissions;
                     callback(YES, dictionary,nil);
                 }
             }];
        }
        else
        {
            callback(NO, nil,[FCUtils getErrorForCode:FCErrorInvalidInput]);
        }
    }
    @catch (NSException *exception) {
        callback(NO, nil,[FCUtils getErrorForCode:FCErrorExceptionOccurred]);
    }
    @finally {
        
    }
}


@end
