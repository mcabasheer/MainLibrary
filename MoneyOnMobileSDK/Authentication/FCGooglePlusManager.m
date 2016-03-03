//
//  FCGooglePlusManager.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to authenticate Google Plus users.
//

#import "FCGooglePlusManager.h"
#import <UIKit/UIKit.h>
#import "FCConstants.h"
#import <GoogleSignIn/GoogleSignIn.h>

@interface FCGooglePlusManager ()  <GIDSignInDelegate, GIDSignInUIDelegate>
@end

@implementation FCGooglePlusManager

+ (FCGooglePlusManager *)sharedInstance
{
    static dispatch_once_t onceToken;
    static FCGooglePlusManager * sharedInstanceAcrossProject;
    dispatch_once(&onceToken, ^{
        sharedInstanceAcrossProject = [[FCGooglePlusManager alloc] init];
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


-(void) getGooglePlusAuthTokenWithClientKey:(NSString *) clientKey fromViewController:(UIViewController *) fromViewController andCompletionHandler:(FCCompletionBlock) callback;
{
    @try {
        gpCallback = callback;
        parentViewController = fromViewController;

        GIDSignIn *signIn = [GIDSignIn sharedInstance];
        signIn.clientID = clientKey;
        signIn.shouldFetchBasicProfile = YES;
        signIn.allowsSignInWithWebView = NO;
        signIn.uiDelegate = [FCGooglePlusManager sharedInstance];;
        signIn.delegate = [FCGooglePlusManager sharedInstance];
        [signIn signIn];
    }
    @catch (NSException *exception) {
        callback(NO, nil,[FCUtils getErrorForCode:FCErrorExceptionOccurred]);
    }
    @finally {
    }
}


#pragma mark GSignInUIDelegate
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error {
//    NSLog(@"signInWillDispatch  Error: <%@>", error.description);
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    [parentViewController presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn
dismissViewController:(UIViewController *)viewController {
    [parentViewController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark GSignInDelegate
// The sign-in flow has finished and was successful if |error| is |nil|.
- (void)signIn:(GIDSignIn *)signIn
didSignInForUser:(GIDGoogleUser *)user
     withError:(NSError *)error;
{
    if (error) {
        gpCallback(NO, nil, error);
    }
    else
    {
        NSString *idToken = user.authentication.idToken;
        gpCallback(YES, [NSDictionary dictionaryWithObject:idToken forKey:kAuthToken], nil);
    }
  }

// Finished disconnecting |user| from the app successfully if |error| is |nil|.
- (void)signIn:(GIDSignIn *)signIn
didDisconnectWithUser:(GIDGoogleUser *)user
     withError:(NSError *)error;
{
    gpCallback(NO, nil, error);
}

@end
