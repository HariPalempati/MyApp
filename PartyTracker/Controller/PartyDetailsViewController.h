//
//  PartyDetailsViewController.h
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 17/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Party.h"
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>

@interface PartyDetailsViewController : UIViewController <UIActionSheetDelegate, ABPeoplePickerNavigationControllerDelegate> {
    
    ABPeoplePickerNavigationController * peoplePicker;
}

@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textTime;
@property (weak, nonatomic) IBOutlet UITextField *textLocation;
@property (weak, nonatomic) IBOutlet UIStepper *guestStepper;
@property (weak, nonatomic) IBOutlet UILabel *labelGuests;


@property (nonatomic , retain) NSMutableArray * Guests;
@property (strong) NSManagedObject * party;

- (IBAction)stepperClicked:(id)sender;
- (IBAction)saveParty:(id)sender;
- (IBAction)cancelParty:(id)sender;
- (IBAction)actionSheet:(id)sender;

@end
