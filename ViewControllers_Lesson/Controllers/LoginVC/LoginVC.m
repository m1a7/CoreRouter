//
//  LoginVC.m
//  ViewControllers_Lesson
//
//  Created by Uber on 06/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "LoginVC.h"

#import "Router.h"

@interface LoginVC ()

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)init
{
    //self = [super init];
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
    
    if (self) {
     
    }
    return self;
}


#pragma mark - Action

- (IBAction)onBoardingAction:(id)sender {
    [[Router sharedRouter] openOnBoarding];
}

- (IBAction)signInAction:(id)sender {
    [[Router sharedRouter] openMainTVC];
}
@end
