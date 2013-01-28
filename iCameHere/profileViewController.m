//
//  profileViewController.m
//  iCameHere
//
//  Created by Roberto Aran on 27/01/13.
//  Copyright (c) 2013 Roberto Aran. All rights reserved.
//

#import "profileViewController.h"

@interface profileViewController ()

@end

@implementation profileViewController

@synthesize userNameLaber, userProfileImage, mapViewUser, linkGoogle, locationManager;
@synthesize postParams = _postParams;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Ask for permission to publish
    NSArray *permissions = [NSArray arrayWithObjects:@"publish_actions", nil];
    
    [[FBSession activeSession] reauthorizeWithPublishPermissions:permissions
                                                 defaultAudience:FBSessionDefaultAudienceFriends
                                               completionHandler:^(FBSession *session, NSError *error) {
                                                   /* handle success + failure in block */
                                               }];
    
    //Check if location service is enabled
    if ( [CLLocationManager locationServicesEnabled] ){
        
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = 1;
        [self.locationManager startUpdatingLocation];
        
    }
    
    if (FBSession.activeSession.isOpen) {
        [self populateUserDetails];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)populateUserDetails
{
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
                 self.userNameLaber.text = user.name;
                 self.userProfileImage.profileID = user.id;
             }
         }];
    }
}

- (IBAction)shareLocation:(id)sender {
    
    
    NSString *strLatitude = [[NSString alloc] initWithFormat:@"%f",mapViewUser.userLocation.coordinate.latitude];
    NSString *strLongitude = [[NSString alloc] initWithFormat:@"%f",mapViewUser.userLocation.coordinate.longitude];
    NSString *linkGoogleMaps = @"http://maps.google.com/?q=";
    NSString *completeLink = [[NSString alloc] initWithFormat:@"%@%@,%@",linkGoogleMaps,strLatitude,strLongitude];
    
    //Publish de current location in user status
    [FBRequestConnection startForPostStatusUpdate:completeLink completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        [self showAlert:completeLink result:result error:error];
    }];
    
    linkGoogle.text = completeLink;
}

- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error {
    
    NSString *alertMsg;
    NSString *alertTitle;
    if (error) {
        alertMsg = error.localizedDescription;
        alertTitle = @"Error";
    } else {
        NSDictionary *resultDict = (NSDictionary *)result;
        alertMsg = [NSString stringWithFormat:@"Successfully posted '%@'.\nPost ID: %@",
                    message, [resultDict valueForKey:@"id"]];
        alertTitle = @"Success";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertTitle
                                                        message:alertMsg
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

@end
