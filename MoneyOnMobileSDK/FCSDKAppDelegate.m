//
//  FCSDKAppDelegate.m
//  
//
//  Created by Basheer Ahamed on 3/2/16.
//
//

#import "FCSDKAppDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "FCConstants.h"
#import "FCUtils.h"
#import <GoogleSignIn/GoogleSignIn.h>

@implementation FCSDKAppDelegate

+ (FCSDKAppDelegate *)sharedInstance
{
    static dispatch_once_t onceToken;
    static FCSDKAppDelegate * sharedInstanceAcrossProject;
    dispatch_once(&onceToken, ^{
        sharedInstanceAcrossProject = [[FCSDKAppDelegate alloc] init];
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


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    NSLog(@"url scheme 1: <%@>", url.absoluteString);
    FCSocialChannelType channelType = FACEBOOK;
    if ([url.absoluteString hasPrefix:cURLSchemeTwitter])
    {
        channelType = TWITTER;
    }
    else if ([url.absoluteString hasPrefix:cURLSchemeFacebook])
    {
        channelType = FACEBOOK;
    }
    else if ([url.absoluteString hasPrefix:cOpenURLSchemeGooglePlus])
    {
        channelType = GOOGLE_PLUS;
    }
    switch (channelType) {
        case GOOGLE_PLUS:
        {
            BOOL response =  [[GIDSignIn sharedInstance] handleURL:url
                                                 sourceApplication:sourceApplication
                                                        annotation:annotation];
            return response;
        }
            break;
        case FACEBOOK:
            return [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
            break;
        default:
            break;
    }
    return NO;
}

- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
    NSLog(@"url scheme 2: <%@>", url.absoluteString);
    FCSocialChannelType channelType = FACEBOOK;
    if ([url.absoluteString hasPrefix:cURLSchemeTwitter])
    {
        channelType = TWITTER;
    }
    else if ([url.absoluteString hasPrefix:cURLSchemeFacebook])
    {
        channelType = FACEBOOK;
    }
    else if ([url.absoluteString hasPrefix:cOpenURLSchemeGooglePlus])
    {
        channelType = GOOGLE_PLUS;
    }
    switch (channelType) {
        case GOOGLE_PLUS:
        {
            BOOL response = [[GIDSignIn sharedInstance] handleURL:url
                                                 sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                        annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
            return response;
            
        }
            break;
        case FACEBOOK:
            return [[FBSDKApplicationDelegate sharedInstance] application:app openURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey] annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
            break;
        default:
            break;
    }
    return NO;
    
    
}


- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[FCSDKAppDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
}



@end
