//
//  FCSocialConnectManager.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to authenticate social channels.
//

#import "FCSocialConnectManager.h"
#import "FCFacebookManager.h"
#import "FCTwitterManager.h"
#import "FCConstants.h"
#import "FCGooglePlusManager.h"
#import "FCUtils.h"
#import "FCFacebookManager.h"
#import "FCTwitterManager.h"
#import "FCGooglePlusManager.h"

static NSMutableArray *readPermissionsArray;
static NSMutableArray *publishPermissionsArray;

@interface FCSocialConnectManager ()
/**
 This method wil seperate Facebook read permissions and publish permissions into two seperate arrays.
 
 Example usage:
 @code
 
 [FCSocialConnectManager seperateReadPermissions:@[@"public_profile", @"email", @"user_friends"]];
 @endcode
 
 @param array
 Facebook read/publish permission list.
 */
+ (void) seperateReadPermissions: (NSArray *) permissions;
@end

@implementation FCSocialConnectManager


+ (FCSocialConnectManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    static FCSocialConnectManager * sharedInstanceAcrossProject;
    dispatch_once(&onceToken, ^{
        sharedInstanceAcrossProject = [[FCSocialConnectManager alloc] init];
    });
    return sharedInstanceAcrossProject;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void) authenticateFacebookWithPermissions:(NSArray *) permissions fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;
{
    // seperate publish permission
    readPermissionsArray = [NSMutableArray new];
    publishPermissionsArray = [NSMutableArray new];
    [FCSocialConnectManager seperateReadPermissions:permissions];
    
    NSMutableArray *permissionArray = [NSMutableArray new];
    
    @try {
        [FCFacebookManager getFacebookAuthTokenWithPermissions:readPermissionsArray fromViewController:fromViewController andCompletionHandler:^(BOOL success, id response, NSError *error)
         {
             if (success == YES) {
                 NSDictionary *responseDictionary = (NSDictionary *) response;
                 if ([responseDictionary objectForKey:kPermissionSet] != nil) {
                     
                     // permissions available. save it in response
                     NSSet *permissionSet = (NSSet *)[responseDictionary objectForKey:kPermissionSet];
                     [permissionArray addObjectsFromArray:[permissionSet allObjects]];
                     // when read permission request is success, try publish request
                     if (success == YES) {
                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                             
                             [FCFacebookManager getFacebookPublishAuthTokenWithPermissions:publishPermissionsArray fromViewController:fromViewController andCompletionHandler:^(BOOL success, id response, NSError *error)
                              {
                                  
                                  // convert the response object to mutable dictionary
                                  NSMutableDictionary *responseMutableDictionary = (NSMutableDictionary *) response;
                                  // assign the permission set to existing array
                                  NSSet *publishSet = (NSSet *)[responseMutableDictionary objectForKey:kPermissionSet];
                                  [permissionArray addObjectsFromArray:[publishSet allObjects]];
                                  // set back the updated permission array in response
                                  [responseMutableDictionary setObject:permissionArray forKey:kPermissionSet];
                                  
                                  // return the response
                                  callback(success, responseMutableDictionary, error);
                              }];
                         });
                     }
                     else
                     {
                         callback(success, response, error);
                     }
                 }
                 else
                 {
                     // granted permissions are not available
                     callback(success, response, error);
                 }
             }
             else
             {
                 callback(success, response, error);
             }
         }];
    }
    @catch (NSException *exception) {
        callback(NO, nil,[FCUtils getErrorForCode:FCErrorExceptionOccurred]);
    }
    @finally {
    
    }
}


-(void)authenticateTwitterChannelWithConsumerKey:(NSString *) consumerKey andSecretKey:(NSString *) secretKey andCompletionHandler:(FCCompletionBlock) callback;
{
    
    @try {
        [FCTwitterManager getTwitterAuthTokenWithConsumerKey:consumerKey andSecretKey:secretKey andCompletionHandler:^(BOOL success, id response, NSError *error)
         {
             callback(success, response, error);
         }];
    }
    @catch (NSException *exception) {
        callback(NO, nil,[FCUtils getErrorForCode:FCErrorExceptionOccurred]);
    }
    @finally {
        
    }
}



-(void) authenticateGooglePlusChannelWithClientKey:(NSString *) clientKey fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;
{
    @try {
        [[FCGooglePlusManager sharedInstance] getGooglePlusAuthTokenWithClientKey:clientKey fromViewController:fromViewController andCompletionHandler:^(BOOL success, id response, NSError *error)
         {
             callback(success, response, error);
         }];
    }
    @catch (NSException *exception) {
        callback(NO, nil,[FCUtils getErrorForCode:FCErrorExceptionOccurred]);
    }
    @finally {
        
    }
}

+ (void) seperateReadPermissions: (NSArray *) permissions
{
    for (int i = 0; i < permissions.count; i++) {
        NSString *permissionString = [permissions objectAtIndex:i];
        if (permissionString != nil)
        {
            if([permissionString hasPrefix:@"publish"] || [permissionString hasPrefix:@"manage"] || [permissionString hasPrefix:@"ads_management"] || [permissionString hasPrefix:@"create_event"] || [permissionString hasPrefix:@"rsvp_event"]) {
                [publishPermissionsArray addObject:permissionString];
            }
            else
            {
                [readPermissionsArray addObject:permissionString];
            }
        }
    }
}

@end
