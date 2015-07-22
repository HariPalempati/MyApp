//
//  FBLoginViewController.m
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 20/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import "FBLoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "Friends.h"

@interface FBLoginViewController () {
    
    //FBSDKLoginButton * loginButton;
     FBLoginView * loginButton;
    UILabel * labelLoginStatus;
    FBProfilePictureView * profilePicture;
    UILabel * labelUsername;
    UILabel * labelEmail;
    UIButton * friends;
}

@end

@implementation FBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        //[FBLoginView class];
      //  [FBProfilePictureView class];
    self.view.backgroundColor = [UIColor whiteColor];

//    [self toggleHiddenState:YES];
////    self.labelLoginStatus.text = @"";
//    
    self->loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    loginButton = [[FBLoginView alloc] initWithFrame:CGRectMake(100, 430, 200, 50)];
    //loginButton.center = self.view.center;
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
    
    labelLoginStatus = [[UILabel alloc]initWithFrame:CGRectMake(50, 70, 280, 25)];
    [self.view addSubview:labelLoginStatus];
    //[labelLoginStatus setText:@"LoginStatus"];
    [labelLoginStatus setTextAlignment:NSTextAlignmentCenter];
    [labelLoginStatus setTextColor:[UIColor redColor]];
    
    profilePicture = [[FBProfilePictureView alloc]initWithFrame:CGRectMake(120, 100, 150, 150)];
    [self.view addSubview:profilePicture];
    
    labelUsername = [[UILabel alloc]initWithFrame:CGRectMake(50, 260, 280, 25)];
    [self.view addSubview:labelUsername];
    //[labelUsername setText:@"username"];
    [labelUsername setTextAlignment:NSTextAlignmentCenter];
    [labelUsername setTextColor:[UIColor blueColor]];
    
    labelEmail = [[UILabel alloc]initWithFrame:CGRectMake(20, 290, 280, 25)];
    [self.view addSubview:labelEmail];
    //[labelEmail setText:@"email"];
    [labelEmail setTextAlignment:NSTextAlignmentCenter];
    
    friends = [[UIButton alloc]initWithFrame:CGRectMake(50, 330, 280, 25)];
    [friends setTitle:@"Get Friends" forState:UIControlStateNormal];
    [friends setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [friends addTarget:self action:@selector(getFriends) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:friends];
    
    [self HiddenState:YES];
    
    self->loginButton.readPermissions = @[@"public_profile", @"email"];
    
//    [self loginViewShowingLoggedInUser:loginButton];
//    [self loginViewShowingLoggedInUser:loginButton];
//    [self loginViewFetchedUserInfo:loginButton user:user];
    
}

//-(void)getFriendsListWithCompleteBlock:(void (^)(NSArray *, NSString *))completed{
//    
//    if (!FBSession.activeSession.isOpen)
//    {
//        NSLog(@"permissions::%@",FBSession.activeSession.permissions);
//        
//        // if the session is closed, then we open it here, and establish a handler for state changes
//        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info", @"user_friends"]
//                                           allowLoginUI:YES
//                                      completionHandler:^(FBSession *session,
//                                                          FBSessionState state,
//                                                          NSError *error) {
//                                          if (error)
//                                          {
//                                              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                                                                  message:error.localizedDescription
//                                                                                                 delegate:nil
//                                                                                        cancelButtonTitle:@"OK"
//                                                                                        otherButtonTitles:nil];
//                                              [alertView show];
//                                          }
//                                          else if (session.isOpen)
//                                          {
//                                             // [self showWithStatus:@""];
//                                              FBRequest *friendRequest = [FBRequest requestForGraphPath:@"me/friends?fields=name,picture,gender"];
//                                              
//                                              
//                                              [friendRequest startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
//                                                  NSArray *data = [result objectForKey:@"data"];
//                                                  NSMutableArray *friendsList = [[NSMutableArray alloc] init];
//                                                  for (FBGraphObject<FBGraphUser> *friend in data)
//                                                  {
//                                                      //NSLog(@"friend:%@", friend);
//                                                      NSDictionary *picture = [friend objectForKey:@"picture"];
//                                                      NSDictionary *pictureData = [picture objectForKey:@"data"];
//                                                      //NSLog(@"picture:%@", picture);
//                                                      NSData *fb = [[NSData alloc]initWithData:(NSString *)[friend objectForKey:@"name"]
//                                                                    userID:(NSInteger)[[friend objectForKey:@"id"] integerValue]
//                                                                    gender:(NSString*)[friend objectForKey:@"gender"]
//                                                                    photoURL:(NSString*)[pictureData objectForKey:@"url"]
//                                                                    photo:(UIImage*)nil
//                                                                    isPhotoDownloaded:(BOOL)NO];
//                                                      [friendsList addObject:fb];
//                                                  }
//                                                  
//                                                //  [self dismissStatus];
//                                                  if (completed) {
//                                                      completed(friendsList,@"I got it");
//                                                  }
//                                              }];
//                                              
//                                              
//                                          }
//                                      }];
//    }
//}

- (void)getFriends {
    
//    FBFriendPickerViewController * fp = [[FBFriendPickerViewController alloc]init];
//    [fp loadData];
//    [fp presentModallyFromViewController:self animated:YES handler:^ (FBViewController * sender, BOOL donePressed) {
//        if (donePressed) {
//            self.friends = fp.selection;
//            NSLog(@"Success");
//        }
//    }];
    
//    FBRequest* friendsRequest = [FBRequest requestForMyFriends];
//    [friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection,
//                                                  NSDictionary* result,
//                                                  NSError *error) {
//        NSArray* friends = [result objectForKey:@"data"];
//        NSLog(@"Found: %lu friends", (unsigned long)friends.count);
//        for (NSDictionary<FBGraphUser>* friend in friends) {
//            NSLog(@"I have a friend named %@ with id %@", friend.name, friend.id);
//        }
//    }];
    
//    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
//                                  initWithGraphPath:@"/{friendlist-id}"
//                                  parameters:params
//                                  HTTPMethod:@"GET"];
//    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
//                                          id result,
//                                          NSError *error) {
//        // Handle the result
//    }];
    
    Friends * f = [[Friends alloc]init];
    [self.navigationController pushViewController:f animated:YES];
    
    NSLog(@"friends");
}

-(void) HiddenState:(BOOL)shouldHide{

    labelUsername.hidden = shouldHide;
    labelEmail.hidden = shouldHide;
    profilePicture.hidden = shouldHide;
    friends.hidden = shouldHide;
//    self.labelUsername.hidden = shouldHide;
//    self.labelEmail.hidden = shouldHide;
//    self.profilePicture.hidden = shouldHide;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
  
    labelLoginStatus.text = @"You are logged in.";
    
    [self HiddenState:NO];
    
    NSLog(@"Login");
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    
    NSLog(@"Fecth");
    NSLog(@"%@", user);
    self->profilePicture.profileID = user.id;
    labelUsername.text = user.name;
    labelEmail.text = [user objectForKey:@"email"];
    
    NSLog(@"INFO");
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    
    labelLoginStatus.text = @"You are logged out";
    
    NSLog(@"Logout");
    
    [self HiddenState:YES];
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    
    NSLog(@"%@", [error localizedDescription]);
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

@end
