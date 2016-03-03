//
//  FCSocialFriend.m
//
//  Author : Basheer Ahamed
//  Creation date : 3/2/16.
//  Purpose : Defines the Social friend properties and methods.
//

#import "FCSocialFriend.h"

@implementation FCSocialFriend

-(instancetype) init
{
    if (self == [super init]) {
        // Initialize default values
        self.firstName = @"";
        self.middleName = @"";
        self.lastName = @"";
        self.displaySocialID = @"";
    }
    return self;
}

- (void) setProfileImageURL:(NSString *)profileImageURL
{
    if (profileImageURL) {
        [self downloadImageWithURL:[NSURL URLWithString:profileImageURL] completionBlock:^(BOOL succeeded, UIImage *image) {
            if (succeeded) {
                // change the image in the cell
                self.profileImage = image;
            }
        }];
    }
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}

@end
