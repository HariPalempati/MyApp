//
//  Friends.h
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 21/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBLoginViewController.h"
#import "Party.h"
#import "Guest.h"
#import "GuestTableViewController.h"

@interface Friends : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    
    UITableView * table;
    
    NSMutableArray * Array;
    
    //ViewController * vc;
    
    //NSDictionary * friendCollection;
    
    //NSMutableArray * friendsArray;
    
}

-(void)getFriendsArray;

//Declare the block that will execute after receiving success from the method

typedef void (^FriendsCallbackSuccess)(NSArray *successArray);

//Declre the block that will execute after receiving error from the method

typedef void (^FriendsCallbackError)(NSString *errorString);

@property (strong,nonatomic)FriendsCallbackSuccess success;

@property (strong,nonatomic)FriendsCallbackError error;

//Create an array that will be used for storing the dictionary of friends from facebook

@property (strong, nonatomic)NSArray *theFriendsArray;

//@property (strong, nonatomic)NSMutableArray * friendsArray;

@property (nonatomic, copy) GuestTableViewController *aReference;

@property (strong , nonatomic) NSMutableArray * guests;

@property (strong) NSManagedObject * guest;

@end



