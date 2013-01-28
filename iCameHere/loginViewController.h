//
//  loginViewController.h
//  iCameHere
//
//  Created by Roberto Aran on 27/01/13.
//  Copyright (c) 2013 Roberto Aran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "AppDelegate.h"

@interface loginViewController : UIViewController

//Outlets
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *showFriendsButton;
@property (strong, nonatomic) UIActivityIndicatorView *aiv;

//Actions
- (IBAction)facebookLogin:(id)sender;


@end
