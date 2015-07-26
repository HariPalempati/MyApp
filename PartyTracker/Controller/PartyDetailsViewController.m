//
//  PartyDetailsViewController.m
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 17/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import "PartyDetailsViewController.h"
#import "Party.h"
#import "GuestTableViewController.h"
#import "FBLoginViewController.h"

@interface PartyDetailsViewController () {
    
    double stepValue;
}

@property (nonatomic, copy) GuestTableViewController * aReference1;

@end

@implementation PartyDetailsViewController

@synthesize aReference1 = _aReference1;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.party) {
        
        [self.textName setText:[self.party valueForKey:@"partyName"]];
        [self.textTime setText:[self.party valueForKey:@"partyTime"]];
        [self.textLocation setText:[self.party valueForKey:@"partyLocation"]];
        //[self.labelGuests setText:[self.party valueForKey:@"partyGuests"]];
        //[self.labelGuests setText:[NSString stringWithFormat:@"%f", stepValue]];
    }
    
    if (self.guest) {
        
        [self.aReference1.labelGuest setText:[self.guest valueForKey:@"guestName"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)stepperClicked:(id)sender {
    
    stepValue = self.guestStepper.value;
    
    [_labelGuests setText:[NSString stringWithFormat:@"%f", stepValue]];
}

- (IBAction)saveParty:(id)sender {
    
        NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.party) {
        
        NSLog(@"setting existing party");
        [self.textName setText:[self.party valueForKey:@"partyName"]];
        [self.textTime setText:[self.party valueForKey:@"partyTime"]];
        [self.textLocation setText:[self.party valueForKey:@"partyLocation"]];
        //[self.labelGuests setText:[self.party valueForKey:@"partyGuests"]];
        //[self.labelGuests setText:[NSString stringWithFormat:@"%f", stepValue]];
    }
    else {
    
    // Create a new managed object
    NSManagedObject * managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Party" inManagedObjectContext:context];
    [managedObject setValue:self.textName.text forKey:@"partyName"];
    [managedObject setValue:self.textTime.text forKey:@"partyTime"];
    [managedObject setValue:self.textLocation.text forKey:@"partyLocation"];
   // [managedObject setValue:self.labelGuests forKey:@"partyGuests"];
    //[self.labelGuests setText:[NSString stringWithFormat:@"%f", stepValue]];
       // [managedObject setValue:[NSString stringWithFormat:@"%f", stepValue ] forKey:@"partyGuests"];
    
    }
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    NSLog(@"dismiss reached");
    [self dismissViewControllerAnimated:YES completion:nil];
    //[self popoverPresentationController];
    
    //[self]
   }

- (IBAction)cancelParty:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)actionSheet:(id)sender {
    
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:@"Select Friends From:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Address Book", @"Facebook", nil];

    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        
        NSLog(@"Address book");
        
        peoplePicker = [[ABPeoplePickerNavigationController alloc]init];
        peoplePicker.peoplePickerDelegate = self;
        [self presentViewController:peoplePicker animated:YES completion:nil];
    }
    
    if (buttonIndex == 1) {
        
        NSLog(@"Facebook");
        
        FBLoginViewController * fb = [[FBLoginViewController alloc]init];
        
        [self.navigationController pushViewController:fb animated:YES];
    }
}

// Called after a person has been selected by the user.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController*)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier NS_AVAILABLE_IOS(8_0) {
 
//    NSString * name = (__bridge_transfer NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
//    NSLog(@"Name Selected is %@", name);
//    
//    _Guests = [[NSMutableArray alloc]init];
//    [_Guests addObject:name];
//    
//    NSLog(@"Guests Count: %lu",(unsigned long)[_Guests count]);
//    
//    NSManagedObjectContext *context = [self managedObjectContext];
//    
//    if (self.guest) {
//        
//        NSLog(@"setting existing guest");
//        [self.aReference1.labelGuest setText:[self.guest valueForKey:@"guestName"]];
////        [self.textName setText:[self.party valueForKey:@"partyName"]];
////        [self.textTime setText:[self.party valueForKey:@"partyTime"]];
////        [self.textLocation setText:[self.party valueForKey:@"partyLocation"]];
////        //[self.labelGuests setText:[self.party valueForKey:@"partyGuests"]];
//        //[self.labelGuests setText:[NSString stringWithFormat:@"%f", stepValue]];
//    }
//    else {
//        
//        // Create a new managed object
//        NSManagedObject * managedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Guest" inManagedObjectContext:context];
//        [managedObject setValue:self.aReference1.labelGuest.text forKey:@"guestName"];
////        [managedObject setValue:self.textName.text forKey:@"partyName"];
////        [managedObject setValue:self.textTime.text forKey:@"partyTime"];
////        [managedObject setValue:self.textLocation.text forKey:@"partyLocation"];
//        // [managedObject setValue:self.labelGuests forKey:@"partyGuests"];
//        //[self.labelGuests setText:[NSString stringWithFormat:@"%f", stepValue]];
//        // [managedObject setValue:[NSString stringWithFormat:@"%f", stepValue ] forKey:@"partyGuests"];
//        
//    }
//    NSError *error = nil;
//    // Save the object to persistent store
//    if (![context save:&error]) {
//        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
//    }
//    
    NSLog(@"dismiss reached");
    
    
    if (property == kABPersonPhoneProperty)
    {
        NSString * firstname = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
        NSString * lasttname = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
        
        ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
        
        NSString * mobile = (__bridge NSString *)(ABMultiValueCopyValueAtIndex(phoneNumbers, identifier));
        
        NSMutableDictionary * objDict = [[NSMutableDictionary alloc]init];
        [objDict setObject:[NSString stringWithFormat:@"%@ %@",firstname,lasttname] forKey:@"name"];
        
        [objDict setObject:mobile forKey:@"number"];
        
        [_Guests addObject:objDict];
        
   //     [GuestTableViewController._]
        
      //  [UITableView ]
        //table view reload
        NSLog(@"selected object is: %@", objDict);
        
        
        
    }
    
    
    GuestTableViewController * gc = [[GuestTableViewController alloc]init];
    
    [self.navigationController pushViewController:gc animated:YES];
    
}

// Called after a property has been selected by the user.

// Called after the user has pressed cancel.
- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
