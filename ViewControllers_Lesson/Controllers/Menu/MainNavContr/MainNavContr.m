//
//  MainNavContr.m
//  ViewControllers_Lesson
//
//  Created by Uber on 06/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "MainNavContr.h"

@interface MainNavContr ()

@end

@implementation MainNavContr

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/* Customize
 https://stackoverflow.com/questions/19029833/ios-7-navigation-bar-text-and-arrow-color
 */

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    
    if (self) {

        [self setupUI];
    }
    return self;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];

    }
    return self;
}

- (void) setupUI {
    self.navigationBar.barTintColor = [UIColor lightGrayColor];
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    
    [self.navigationBar setTitleTextAttributes:  @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                  NSFontAttributeName:[UIFont fontWithName:@"Avenir Next" size:18]}];
    
}
@end
