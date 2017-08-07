//
//  MainOnBoardingVC.m
//  ViewControllers_Lesson
//
//  Created by Uber on 06/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "MainOnBoardingVC.h"

#import "Router.h"

@interface MainOnBoardingVC ()

@end

@implementation MainOnBoardingVC

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (instancetype)init
{
    //self = [super init];
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"MainOnBoardingVC"];
    
    if (self) {
        
    }
    return self;
}


#pragma mark - Action

- (IBAction)beginUseAppAction:(id)sender {
  
    [[Router sharedRouter] openMainTVC];
}

@end
