//
//  FCSocialFriend.h
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Defines the Social friend properties and methods.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FCConstants.h"

@interface FCSocialFriend : NSObject

@property(nonatomic, strong) NSString* firstName;
@property(nonatomic, strong) NSString* middleName;
@property(nonatomic, strong) NSString* lastName;
@property(nonatomic, strong) NSString* socialID;
@property(nonatomic) int contactID;
@property(nonatomic, strong) NSString* displaySocialID;
@property (nonatomic) FCSocialChannelType channelType;
@property (nonatomic) UIImage *profileImage;
@property (nonatomic, strong) NSString *profileImageURL;

@end
