//
//  DetailVC.m
//  ViewControllers_Lesson
//
//  Created by Uber on 06/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()

@property (weak, nonatomic) IBOutlet UILabel *indexPathLabel;

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.indexPathLabel.text = [NSString stringWithFormat:@"indexPath: %@",_indexPathText];
}



- (instancetype)init
{
    //self = [super init];
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self = [storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
    if (self) {
        
    }
    return self;
}


@end
