//
//  GTMainTableViewController.m
//  CoreAnimationLibrary
//
//  Created by liuchunxi on 2019/1/14.
//  Copyright © 2019年 imera. All rights reserved.
//

#import "GTMainTableViewController.h"
#import "GTCardOverTurnViewController.h"
#import "GTActivityIndicatorViewController.h"

@interface GTMainTableViewController ()

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation GTMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CoreAnimation";
    self.dataSource = @[@"CardOverTurn", @"ActivityIndicator"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    NSString *title = self.dataSource[indexPath.row];
    cell.textLabel.text = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            GTCardOverTurnViewController *vc = [[GTCardOverTurnViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        case 1:
        {
            GTActivityIndicatorViewController *vc = [[GTActivityIndicatorViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}


@end
