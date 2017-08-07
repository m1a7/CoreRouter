//
//  CoreRouterProtocol.h
//  ViewControllers_Lesson
//
//  Created by Uber on 07/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreRouter.h"

@protocol CoreRouterProtocol <NSObject>

@required

+ (CoreRouter*) sharedRouter;
- (void) openApplication;

@end
