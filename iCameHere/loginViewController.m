//
//  loginViewController.m
//  iCameHere
//
//  Created by Roberto Aran on 27/01/13.
//  Copyright (c) 2013 Roberto Aran. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

@synthesize loginButton, showFriendsButton, aiv;

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
    
    [showFriendsButton setHidden:YES];
    [loginButton setTitle:@"Facebook Login" forState:0];
    
    // See if we have a valid token for the current state.
    if (FBSession.activeSession.state == FBSessionStateCreatedTokenLoaded) {
        
        [loginButton setTitle:@"Logout" forState:0];
        [showFriendsButton setHidden:NO];
        
    } else {

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)facebookLogin:(id)sender {

    if ( showFriendsButton.hidden ) {
        
        //Activity Indicator
        aiv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        aiv.center = self.view.center;
        
        [aiv startAnimating];
        
        [self.view addSubview:aiv];
        
        //register appDelegate to receive Call back from Safari or Facebook App
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        
        //Call Method for login and open Session
        [appDelegate openSession];
        

    }else{
        
        //Logout Procedure
        [FBSession.activeSession closeAndClearTokenInformation];
        [self viewDidLoad];
        
    };
    



}




@end
