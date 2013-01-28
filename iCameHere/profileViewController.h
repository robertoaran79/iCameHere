//
//  profileViewController.h
//  iCameHere
//
//  Created by Roberto Aran on 27/01/13.
//  Copyright (c) 2013 Roberto Aran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface profileViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;
@property (strong, nonatomic) IBOutlet UILabel *userNameLaber;
@property (weak, nonatomic) IBOutlet MKMapView *mapViewUser;
@property (weak, nonatomic) IBOutlet UILabel *linkGoogle;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (strong, nonatomic) NSMutableDictionary *postParams;

- (IBAction)shareLocation:(id)sender;
@end
