//
//  MainTVC.h
//  ViewControllers_Lesson
//
//  Created by Uber on 06/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 ! Но в будущем мы это удалим т.к. решение о переходе должно быть в ViewModel
 */
// Router
//#import "Router.h"

typedef NS_ENUM(NSInteger, CategoryFromLeftSideMenu) {
    Candle,
    Cauldron,
    Fence,
    Pumpkin,
    Scarecrow
};

@interface MainTVC : UITableViewController

- (void) updateTableContentWithCategory:(CategoryFromLeftSideMenu) category;


@end
