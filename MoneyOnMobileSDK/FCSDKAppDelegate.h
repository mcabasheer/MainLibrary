//
//  FCSDKAppDelegate.h
//  
//
//  Created by Basheer Ahamed on 3/2/16.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
    FCSDKAppDelegate
    This class will be used to navigate to other application and return to our application.
 */

@interface FCSDKAppDelegate : NSObject

/**
 Singleton class object.
 
 Example usage:
 @code
 [FCSDKAppDelegate sharedInstance];
 @endcode
 */
+ (instancetype)sharedInstance;

/**
 Call this method from your application delegate when other applcation trying to call source application.
 */
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;

/**
 Call this method from your application delegate when you application didFinishLaunchingWithOptions method is called.
 */
- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

/**
 Call this method from your application delegate when other applcation trying to call source application with options.
 */
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options;
@end
