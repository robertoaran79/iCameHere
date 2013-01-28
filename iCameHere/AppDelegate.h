//
//  AppDelegate.h
//  iCameHere
//
//  Created by Roberto Aran on 27/01/13.
//  Copyright (c) 2013 Roberto Aran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "loginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (strong, nonatomic) UIActivityIndicatorView *aiv;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void) openSession;

@end
