//
//  GuestTableViewController.m
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 17/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import "GuestTableViewController.h"
#import "AppDelegate.h"
#import "PartyDetailsViewController.h"

@interface GuestTableViewController ()
@property (nonatomic , copy) PartyDetailsViewController * aReference;

@end

@implementation GuestTableViewController
@synthesize aReference = _aReference;

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the parties from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"Guest"];
    self.guests = [[managedObjectContext executeFetchRequest:request error:nil] mutableCopy];
    
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.guests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
//    NSManagedObject * managedObject = [self.aReference.Guests objectAtIndex:indexPath.row];
//    //[cell.textLabel setText:[NSString stringWithFormat:@"%@ ", [managedObject valueForKey:@"guestName"]]];
//    
//    //[cell.textLabel setText:[_guests objectAtIndex:indexPath.row] ]
//    
//    //cell.textLabel.text = @"Hari";
//    return cell;
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    NSDictionary * dict = [_aReference.Guests objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"name"];
    //cell.textLabel.text = [dict valueForKey:@"name"];
    cell.textLabel.text = @"Hari";
    cell.detailTextLabel.text = [dict objectForKey:@"number"];
    
    //[self.tableView reloadData];
   // [tableView reloadData];
    
    return cell;
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
