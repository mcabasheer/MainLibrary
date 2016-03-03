//
//  FCFriendListManager.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : This class is responsible to fetch friend list based on social channels.
//

#import "FCFriendListManager.h"
#import "FCUtils.h"
#import <AddressBook/AddressBook.h>
#import "FCSocialFriend.h"

static FCSocialChannelType currentChannel;
@import AddressBook;

@implementation FCFriendListManager

+(void) fetchFriendListWithType:(FCSocialChannelType) channelType andCompletionHandler:(FCCompletionBlock) callback;
{
    @try {
        currentChannel = channelType;
        
        // check whether the channel is supported by sdk
        if ([FCFriendListManager canFetchFriendList:channelType] == NO) {
            callback(NO, nil, [FCUtils getErrorForCode:FCErrorUnsupportedChannel]);
            return;
        }
        
        // check whether the channel is installed on device
        BOOL isAppInstalled = [FCUtils isAppInstalledForType:channelType];
        if (isAppInstalled == NO) {
            // channel not installed on device
            callback(NO, nil,  [FCUtils getErrorForCode:FCErrorAppNotInstalled]);
            return;
        }
        
        // Fetch friends list
        switch (ABAddressBookGetAuthorizationStatus()) {
            case kABAuthorizationStatusDenied:
            case kABAuthorizationStatusRestricted:
            {
                NSLog(@"Denied");
                callback(NO, nil, [FCUtils getErrorForCode:FCErrorDeniedPermission]);
            }
            break;
            case kABAuthorizationStatusAuthorized:
            {
                NSLog(@"Authorized");
                NSMutableArray *friendsArray = [FCFriendListManager fetchFriendsList];
                if (friendsArray.count > 0) {
                    callback(YES, friendsArray, nil);
                }
                else
                {
                    callback(NO, nil, [FCUtils getErrorForCode:FCErrorNoDataFound]);
                }
            }
                break;
            default:
            {
                ABAddressBookRequestAccessWithCompletion(ABAddressBookCreateWithOptions(NULL, nil), ^(bool granted, CFErrorRef error) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (!granted){
                            //4
                            callback(NO, nil,  [FCUtils getErrorForCode:FCErrorInvalidPermissionContacts]);
                        }
                        else
                        {
                            //5
                            NSMutableArray *friendsArray = [FCFriendListManager fetchFriendsList];
                            if (friendsArray.count > 0) {
                                callback(YES, friendsArray, nil);
                            }
                            else
                            {
                                callback(NO, nil,  [FCUtils getErrorForCode:FCErrorNoDataFound]);
                            }
                        }
                        return;
                    });
                });
            }
            break;
        }
    }
    @catch (NSException *exception) {
        callback(NO, nil, [FCUtils getErrorForCode:FCErrorExceptionOccurred]);
    }
    @finally {
        
    }
    
}

+ (NSMutableArray *) fetchFriendsList
{
    NSMutableArray *friendsArray = [NSMutableArray new];
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, nil);
    NSArray *allContacts = (__bridge NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBookRef);
    for (id record in allContacts)
    {
        ABRecordRef thisContact = (__bridge ABRecordRef)record;
        CFTypeRef  firstName = ABRecordCopyValue(thisContact, kABPersonFirstNameProperty);
        CFTypeRef  middleName = ABRecordCopyValue(thisContact, kABPersonMiddleNameProperty);
        CFTypeRef  lastName = ABRecordCopyValue(thisContact, kABPersonLastNameProperty);

        ABRecordID  contactID = ABRecordGetRecordID(thisContact);
        
        
        if (currentChannel == EMAIL)
        {
            // email contacts
            ABMultiValueRef emailRef = ABRecordCopyValue(thisContact, kABPersonEmailProperty);
            for (int i=0; i < ABMultiValueGetCount(emailRef); i++)
            {
                // initialise the FCSocialFriend object
                
                FCSocialFriend *socialFriend = [[FCSocialFriend alloc] init];
                NSString *firstNameString = (__bridge NSString *)firstName;
                if ([FCUtils checkStringForNull:firstNameString] == YES)
                {
                    socialFriend.firstName = firstNameString;
                }
                
                NSString *middleNameString = (__bridge NSString *)middleName;
                if ([FCUtils checkStringForNull:middleNameString] == YES)
                {
                    socialFriend.middleName = middleNameString;
                }
                
                NSString *lastNameString = (__bridge NSString *)lastName;
                if ([FCUtils checkStringForNull:lastNameString] == YES)
                {
                    socialFriend.lastName = lastNameString;
                }
                
                if (contactID) {
                    socialFriend.contactID = contactID;
                }
                
                CFStringRef currentEmailValue = ABMultiValueCopyValueAtIndex(emailRef, i);
                
                if (currentEmailValue) {
                    if ([FCUtils checkForValidEmail:(__bridge NSString *)currentEmailValue] == YES) {
                        socialFriend.socialID = [NSString stringWithFormat:@"%@_%@", [FCUtils getStringForChannelType:currentChannel], (__bridge NSString *)currentEmailValue];
                        
                        socialFriend.displaySocialID = (__bridge NSString *)currentEmailValue;
                    }
                    else
                        continue;
                }
                
                socialFriend.channelType = currentChannel;
                
                if (ABPersonHasImageData(thisContact)) {
                    NSData *contactImageData = (__bridge NSData *)ABPersonCopyImageDataWithFormat(thisContact, kABPersonImageFormatThumbnail);
                    
                    socialFriend.profileImage = [UIImage imageWithData:contactImageData];
                }
                
                //add the object to mutable array
                 [friendsArray addObject:socialFriend];
            }
           
        }
        else
        {
            // phone contacts
            ABMultiValueRef phonesRef = ABRecordCopyValue(thisContact, kABPersonPhoneProperty);
            for (int i=0; i < ABMultiValueGetCount(phonesRef); i++) {
                // initialise the FCSocialFriend object
                
                FCSocialFriend *socialFriend = [[FCSocialFriend alloc] init];
                
                NSString *firstNameString = (__bridge NSString *)firstName;
                if ([FCUtils checkStringForNull:firstNameString] == YES)
                {
                    socialFriend.firstName = firstNameString;
                }
                
                NSString *middleNameString = (__bridge NSString *)middleName;
                if ([FCUtils checkStringForNull:middleNameString] == YES)
                {
                    socialFriend.middleName = middleNameString;
                }
                
                NSString *lastNameString = (__bridge NSString *)lastName;
                if ([FCUtils checkStringForNull:lastNameString] == YES)
                {
                    socialFriend.lastName = lastNameString;
                }
                
                if (contactID) {
                    socialFriend.contactID = contactID;
                }
                
                CFStringRef currentPhoneValue = ABMultiValueCopyValueAtIndex(phonesRef, i);
                
                if (currentPhoneValue) {
                    socialFriend.socialID = [NSString stringWithFormat:@"%@_%@", [FCUtils getStringForChannelType:currentChannel], (__bridge NSString *)currentPhoneValue];
                }
                
                if (currentPhoneValue) {
                    socialFriend.displaySocialID = (__bridge NSString *)currentPhoneValue;
                }
                
                socialFriend.channelType = currentChannel;
                
                if (ABPersonHasImageData(thisContact)) {
                    NSData *contactImageData = (__bridge NSData *)ABPersonCopyImageDataWithFormat(thisContact, kABPersonImageFormatThumbnail);
                    
                    socialFriend.profileImage = [UIImage imageWithData:contactImageData];
                }
                
                
                //add the object to mutable array
                [friendsArray addObject:socialFriend];
            }

        }
        
        
    }
        return friendsArray;
        
}

+ (BOOL) canFetchFriendList:(FCSocialChannelType) channelType;
{
    // check whether the channel is supported by sdk
    BOOL isAppSupported = [FCUtils isAppSupportedForFetchFriendsWithType:channelType];
    return isAppSupported;
}

@end
