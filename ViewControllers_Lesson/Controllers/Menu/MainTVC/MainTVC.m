//
//  MainTVC.m
//  ViewControllers_Lesson
//
//  Created by Uber on 06/08/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "MainTVC.h"

#import "Router.h"
@interface MainTVC ()
@property NSArray* dataArray;
@end

@implementation MainTVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"LGSideMenuController";
        self.view.backgroundColor = [UIColor whiteColor];
        
        UIImage *hamburg = [[UIImage imageNamed:@"Hamburg"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *backToLoginImage = [[UIImage imageNamed:@"Login"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:hamburg style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backToLoginImage style:UIBarButtonItemStylePlain target:self action:@selector(showRightView)];

    }
    return self;
}

#pragma mark -

- (void)showLeftView {
    [[Router sharedRouter].slideOutMenu showLeftViewAnimated:YES completionHandler:nil];
}

- (void)showRightView {
    [[Router sharedRouter] openLoginVC];
}


- (void) updateTableContentWithCategory:(CategoryFromLeftSideMenu) category
{
    switch (category) {
        case Candle:   [self fillingArray:&_dataArray andCategory:@"Candle"];   break;
        case Cauldron: [self fillingArray:&_dataArray andCategory:@"Cauldron"]; break;
        case Fence:    [self fillingArray:&_dataArray andCategory:@"Fence"];    break;
        case Pumpkin:  [self fillingArray:&_dataArray andCategory:@"Pumpkin"];  break;
        case Scarecrow:[self fillingArray:&_dataArray andCategory:@"Scarecrow"];break;
            
        default: break;
    }
}


- (void)fillingArray:(__strong NSArray**) arr andCategory:(NSString*) category
{
    NSMutableArray* tempArr = [NSMutableArray array];
    for (int i=0; i<=10; i++) {
        [tempArr addObject:[NSString stringWithFormat:@"%@ - %d", category, i]];
    }
    *arr = [NSArray arrayWithArray:tempArr];
    [self.tableView reloadData];
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
    [[Router sharedRouter] openDetailTVC_WithIndexPath:indexPath];
}

@end
