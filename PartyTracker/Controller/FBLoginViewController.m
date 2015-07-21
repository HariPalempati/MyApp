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

@interface FBLoginViewController () {
    
   // FBSDKLoginButton * loginButton;
    FBLoginView * loginButton;
    UILabel * labelLoginStatus;
    FBProfilePictureView * profilePicture;
    UILabel * labelUsername;
    UILabel * labelEmail;
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
//    self->loginButton.readPermissions = @[@"public_profile", @"email"];
    
    loginButton = [[FBLoginView alloc] initWithFrame:CGRectMake(100, 430, 200, 50)];
    //loginButton.center = self.view.center;
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
    
    labelLoginStatus = [[UILabel alloc]initWithFrame:CGRectMake(20, 70, 280, 25)];
    [self.view addSubview:labelLoginStatus];
    //[labelLoginStatus setText:@"LoginStatus"];
    [labelLoginStatus setTextAlignment:NSTextAlignmentCenter];
    
    profilePicture = [[FBProfilePictureView alloc]initWithFrame:CGRectMake(120, 100, 150, 150)];
    [self.view addSubview:profilePicture];
    
    labelUsername = [[UILabel alloc]initWithFrame:CGRectMake(20, 260, 280, 25)];
    [self.view addSubview:labelUsername];
    //[labelUsername setText:@"username"];
    [labelUsername setTextAlignment:NSTextAlignmentCenter];
    
    labelEmail = [[UILabel alloc]initWithFrame:CGRectMake(20, 290, 280, 25)];
    [self.view addSubview:labelEmail];
    //[labelEmail setText:@"email"];
    [labelEmail setTextAlignment:NSTextAlignmentCenter];
    
    [self toggleHiddenState:YES];
    
    self->loginButton.readPermissions = @[@"public_profile", @"email"];
}


-(void)toggleHiddenState:(BOOL)shouldHide{

    labelUsername.hidden = shouldHide;
    labelEmail.hidden = shouldHide;
    profilePicture.hidden = shouldHide;
//    self.labelUsername.hidden = shouldHide;
//    self.labelEmail.hidden = shouldHide;
//    self.profilePicture.hidden = shouldHide;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    labelLoginStatus.text = @"You are logged in.";
    
    [self toggleHiddenState:NO];
    
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
    
    [self toggleHiddenState:YES];
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
