//
//  LeftMenuTVC.m
//  ViewControllers_Lesson
//
//  Created by Uber on 06/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "LeftMenuTVC.h"
#import "UIViewController+LGSideMenuController.h"
#import "Router.h"

@interface LeftMenuTVC ()
@property NSArray* dataArray;
@end

@implementation LeftMenuTVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.dataArray = @[@"1",@"2",@"3",@"4",@"5"];
}


- (id)init {
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
 
        self.view.backgroundColor = [UIColor darkGrayColor];
        //self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.contentInset = UIEdgeInsetsMake(44.0, 0.0, 44.0, 0.0);
        self.tableView.showsVerticalScrollIndicator = NO;
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"myCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    /*
    // Тестовая запись
    if (indexPath.row >= 4){
        [[Router sharedRouter] openLoginVC];
    }
    */
    
    [[Router sharedRouter].navContrForMainTVC popToRootViewControllerAnimated:YES];
    // В реализации MVVM сначала будет отправлятся во ViewModel
    // А уже viewModel будет делегировать в viewcontroller
    [[Router sharedRouter].mainTVC updateTableContentWithCategory:indexPath.row];
 
    
    [self hideLeftViewAnimated:nil];
}

@end
