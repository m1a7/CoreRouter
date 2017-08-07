//
//  Router.h
//  ViewControllers_Lesson
//
//  Created by Uber on 31/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//


// Base Router Implemetation
#import "CoreRouter.h"

// Controllers
#import "MainNavContr.h"
#import "MainTVC.h"
#import "RightMenuTVC.h"
#import "LeftMenuTVC.h"

#import "LoginVC.h"
#import "MainOnBoardingVC.h"
#import "DetailVC.h"
#import "LGSideMenuController.h"

// Protocols
#import "CoreRouterProtocol.h"

@interface Router : CoreRouter <CoreRouterProtocol>

/*  Core  */
+ (Router*) sharedRouter;

#pragma mark - Controllers for menu 

@property (nonatomic, strong) LGSideMenuController* slideOutMenu;
@property (nonatomic, strong) MainNavContr* navContrForMainTVC;

@property (nonatomic, strong) MainTVC*      mainTVC;
@property (nonatomic, strong) LeftMenuTVC*  leftMenuTVC;
@property (nonatomic, strong) RightMenuTVC* rightMenuTVC;

@property (nonatomic, assign) BOOL supportLeftMenu;
@property (nonatomic, assign) BOOL supportRightMenu;

#pragma mark - Helpers Method for Menu Controllers

- (BOOL) haveControllerForMenuInMemory;
- (void) removeFromMemoryControllersForMenu;
- (void) initInMemoryControllersForMenuInitLeftMenu:(BOOL) initLeftMenu andRight:(BOOL) initRightMenu;


#pragma mark - Routing method & propierties

// NSUserDefaults properties
@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, assign) BOOL isLearningOnBoarding;

- (void) setIsLoginInUserDefaults:(BOOL) isLogin;
- (void) setIsLearningOnBoardingInUserDefaults:(BOOL) isLearningOnBoarding;

- (BOOL) getIsLoginFromUserDefault;
- (BOOL) getIsLearningOnBoardingFromUserDefault;

// Open Controllers
- (void) openApplication;
- (void) openLoginVC;
- (void) openOnBoarding;
- (void) openMainTVC;


// TODO: implement in the future

- (void) openInfoTVC;
- (void) openAdvertisingVC;
- (void) openDetailTVC_WithIndexPath:(NSIndexPath*) indexPath;

@end
