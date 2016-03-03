//
//  FCTwitterManager.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to authenticate Twitter users.
//

#import "FCTwitterManager.h"
#import <TwitterKit/TwitterKit.h>
#import <Fabric/Fabric.h>
#import "FCConstants.h"

@implementation FCTwitterManager


+(void)getTwitterAuthTokenWithConsumerKey:(NSString *) consumerKey andSecretKey:(NSString *) secretKey andCompletionHandler:(FCCompletionBlock) callback;
{
    @try {
        [[Twitter sharedInstance] startWithConsumerKey:consumerKey
                                        consumerSecret:secretKey];
        [Fabric with:@[[Twitter sharedInstance]]];
        // Objective-C
        
        [[Twitter sharedInstance] logInWithCompletion:^(TWTRSession *session, NSError *error) {
            if ( session){
                
                NSMutableDictionary *dictionary = [NSMutableDictionary new];
                dictionary[kAuthToken] = session.authToken;
                dictionary[kAuthSecretToken] = session.authTokenSecret;
                dictionary[kUserId] = session.userID;
                callback(YES, dictionary,error);
            }
            else if ( error )
            {
                callback(NO, nil,error);
            }
            else {
                callback(NO, nil,[FCUtils getErrorForCode:FCErrorExceptionOccurred]);
            }
            
        }];
    }
    @catch (NSException *exception) {
        callback(NO, nil,[FCUtils getErrorForCode:FCErrorExceptionOccurred]);
    }
    @finally {
    }
}

@end
