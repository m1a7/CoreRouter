//
//  CoreRouter.m
//  ViewControllers_Lesson
//
//  Created by Uber on 07/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "CoreRouter.h"

@implementation CoreRouter


+ (void) present:(UIViewController*) vc animated:(BOOL) animate
{
    UIViewController* currentVC = [self getRootViewController];
    if (currentVC)
        [currentVC presentViewController:vc animated:animate completion:nil];
    else
        [self setToRootView:vc andAnimationOptions:UIViewAnimationOptionTransitionCrossDissolve];
    
}

+ (void) setToRootView:(UIViewController*) vc andAnimationOptions:(UIViewAnimationOptions) animateOption
{
    UIViewController* currentVC = [self getRootViewController];
    if (vc)
    {
        if (currentVC)
        {
        [UIView transitionFromView:currentVC.view
                            toView:vc.view
                          duration:0.65f
                           options:animateOption
                        completion:^(BOOL finished){
                            // self.window.rootViewController = vc;
                            [CoreRouter getApplicationWindow].rootViewController = vc;
                        }];
        
        } else {
            [[UIApplication sharedApplication].keyWindow setRootViewController:vc];
               }
    }
}

+ (void) pushTo:(UIViewController*) vc inNavContr:(UINavigationController*) navContr
{
    if (vc && navContr)
        [navContr pushViewController:vc animated:YES];
    
}


+ (void) dismissController:(UIViewController*)currentVC
{
    if (currentVC){
        [currentVC dismissViewControllerAnimated:YES completion:nil];
    }
}

+ (void) popViewController:(UINavigationController*) navContr
{
    if (navContr)
       [navContr popViewControllerAnimated:YES];
}

+ (void) popToViewController:(UIViewController*)vc inNavContr:(UINavigationController*)navContr
{
   if (vc && navContr)
       [navContr popToViewController:vc animated:YES];
}


+ (void) popToRootVC:(UINavigationController*) navContr
{
    if (navContr)
        [navContr popToRootViewControllerAnimated:YES];
}

#pragma mark - Internal methods


+ (UIViewController*) getRootViewController {
    return [[[[UIApplication sharedApplication]delegate] window] rootViewController];
}

+ (UIWindow*) getApplicationWindow {
    return [[[UIApplication sharedApplication]delegate] window];
}

@end
