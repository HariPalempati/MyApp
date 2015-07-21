//
//  GuestTableViewController.h
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 17/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuestTableViewController : UITableViewController

@property (strong) NSMutableArray * guests;
@property (weak, nonatomic) IBOutlet UILabel *labelGuest;

@end
