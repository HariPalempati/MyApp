//
//  FBLoginViewController.m
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 20/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import "FBLoginViewController.h"
#import <FacebookSDK/FacebookSDK.h>

@interface FBLoginViewController ()

@end

@implementation FBLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        //[FBLoginView class];
      //  [FBProfilePictureView class];
    self.view.backgroundColor = [UIColor whiteColor];

    [self toggleHiddenState:YES];
    self.labelLoginStatus.text = @"";
    
    self.loginButton.readPermissions = @[@"public_profile", @"email"];
}


-(void)toggleHiddenState:(BOOL)shouldHide{
    
    self.labelUsername.hidden = shouldHide;
    self.labelEmail.hidden = shouldHide;
    self.profilePicture.hidden = shouldHide;
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
