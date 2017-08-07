//
//  CoreRouter.h
//  ViewControllers_Lesson
//
//  Created by Uber on 07/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;


@interface CoreRouter : NSObject

@property (nonatomic, strong) UIWindow* window;

+ (void) present:(UIViewController*) vc animated:(BOOL) animate;
+ (void) setToRootView:(UIViewController*) vc andAnimationOptions:(UIViewAnimationOptions) animateOption;

+ (void) pushTo:(UIViewController*) vc inNavContr:(UINavigationController*) navContr;
+ (void) dismissController:(UIViewController*)currentVC;
+ (void) popViewController:(UINavigationController*) navContr;
+ (void) popToRootVC:(UINavigationController*) navContr;

#pragma mark - Internal methods


+ (UIViewController*) getRootViewController;
+ (UIWindow*) getApplicationWindow;

@end
