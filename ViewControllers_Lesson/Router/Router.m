//
//  Router.m
//  ViewControllers_Lesson
//
//  Created by Uber on 31/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//


// https://stackoverflow.com/questions/18331751/storyboard-and-custom-init
#import "Router.h"


@implementation Router

#pragma mark - Core

+ (Router*) sharedRouter {
    
    static Router* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[Router alloc] init];
        manager.window = [Router getApplicationWindow];
    });
    return manager;
}


#pragma mark - Helpers Method for Menu Controllers

- (BOOL) haveControllerForMenuInMemory
{
   if (_slideOutMenu && _navContrForMainTVC && _mainTVC && (_leftMenuTVC || _rightMenuTVC))
   {
       return YES;
   }
    return NO;
}

- (void) removeFromMemoryControllersForMenu
{
    self.mainTVC       = nil;
    self.leftMenuTVC   = nil;
    self.rightMenuTVC  = nil;
    self.slideOutMenu  = nil;
    self.navContrForMainTVC = nil;
}

- (void) initInMemoryControllersForMenuInitLeftMenu:(BOOL) initLeftMenu andRight:(BOOL) initRightMenu
{
    
    self.mainTVC = [[MainTVC alloc] init];
    if (initLeftMenu){
        self.leftMenuTVC = [[LeftMenuTVC alloc] init];
        self.supportLeftMenu = YES;
    }
    if (initRightMenu) {
        self.rightMenuTVC = [[RightMenuTVC alloc] init];
        self.supportRightMenu = YES;
    }

    self.navContrForMainTVC = [[MainNavContr alloc] initWithRootViewController:_mainTVC];
    self.slideOutMenu = [LGSideMenuController sideMenuControllerWithRootViewController:_navContrForMainTVC
                                                                   leftViewController:_leftMenuTVC
                                                                  rightViewController:_rightMenuTVC];
     self.slideOutMenu.leftViewWidth = 250.0;
     self.slideOutMenu.leftViewPresentationStyle = LGSideMenuPresentationStyleScaleFromBig;
     self.slideOutMenu.rightViewWidth = 100.0;
     self.slideOutMenu.leftViewPresentationStyle = LGSideMenuPresentationStyleSlideBelow;
}


#pragma mark - NSUserDefault

- (void) setIsLoginInUserDefaults:(BOOL) isLogin
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:[NSNumber numberWithBool:isLogin]  forKey:@"isLogin"];
}

- (void) setIsLearningOnBoardingInUserDefaults:(BOOL) isLearningOnBoarding
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:[NSNumber numberWithBool:isLearningOnBoarding]  forKey:@"isLearningOnBoarding"];
}

- (BOOL) getIsLoginFromUserDefault
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud boolForKey:@"isLogin"];
}

- (BOOL) getIsLearningOnBoardingFromUserDefault
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    return [ud boolForKey:@"isLearningOnBoarding"];
}


#pragma mark - Open Controllers

- (void) openApplication
{
    // Debug version
    BOOL isLogin = NO;
    BOOL isLearningOnBoarding = NO;
    
    if (!isLogin){
        [self openLoginVC];
    }
    else if (!isLearningOnBoarding)
    {
        [self openOnBoarding];
    } else {
        [self openMainTVC];
    }
    /*
     // Release version
    BOOL isLogin = [self getIsLoginFromUserDefault];
    BOOL isLearningOnBoarding = [self getIsLearningOnBoardingFromUserDefault];
    
    if (!isLogin){
         [self openLoginVC];
    }
    else if (!isLearningOnBoarding)
    {
         [self openOnBoarding];
    } else {
         [self openMainTVC];
    }
     */
}

- (void) openLoginVC
{
    LoginVC* vc = [[LoginVC alloc] init];
    //vc.myViewModel =  [LoginViewModel new];
    [Router setToRootView:vc andAnimationOptions:UIViewAnimationOptionTransitionFlipFromLeft];

}

- (void) openOnBoarding
{
    MainOnBoardingVC* onBoardingVC = [[MainOnBoardingVC alloc] init];
    //onBoardingVC.myViewModel =  [MainOnBoardingVM new];
    [Router setToRootView:onBoardingVC andAnimationOptions:UIViewAnimationOptionTransitionCrossDissolve];

}

- (void) openMainTVC
{
    if (![self haveControllerForMenuInMemory]){
         [self initInMemoryControllersForMenuInitLeftMenu:YES andRight:NO];
    }
    
    [Router setToRootView:self.slideOutMenu andAnimationOptions:UIViewAnimationOptionTransitionFlipFromRight];

}

// TODO: implement in the future

- (void) openInfoTVC;
{ }

- (void) openAdvertisingVC
{ }

- (void) openDetailTVC_WithIndexPath:(NSIndexPath*) indexPath
{
    DetailVC* vc = [[DetailVC alloc] init];
    vc.indexPathText = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    
    if ([self haveControllerForMenuInMemory]){
        [Router pushTo:vc inNavContr:self.navContrForMainTVC];
    }

}




@end
