//
//  ViewController.m
//  ExampleMigration
//
//  Created by QSOFT on 3/13/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import "ViewController.h"
#import <CoreData+MagicalRecord.h>
#import "User.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(save)];
    [self getDataBase];
}

- (void)save{
    NSArray *arrayData = [User MR_findAllInContext:[NSManagedObjectContext MR_defaultContext]];
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"uuid=%ld", arrayData.count+1];
        User *user = [User MR_findFirstWithPredicate:predicate inContext:localContext];
        if (!user) {
            user = [User MR_createInContext:localContext];
            user.name = [NSString stringWithFormat:@"name_%ld", (long)arrayData.count];
            user.uuid = [NSString stringWithFormat:@"%ld", (long)arrayData.count+1];
            user.address = [NSString stringWithFormat:@"address_%ld", (long)arrayData.count];
        }
    }];
    NSArray *arrayDataFind = [User MR_findAllSortedBy:@"uuid" ascending:YES inContext:[NSManagedObjectContext MR_defaultContext] ];
    [self.array removeAllObjects];
    self.array = [NSMutableArray arrayWithArray:arrayDataFind];
    [self.tbView reloadData];
}

- (void)getDataBase {
    NSArray *arrayData = [User MR_findAllSortedBy:@"uuid" ascending:YES inContext:[NSManagedObjectContext MR_defaultContext] ];
    self.array = [[NSMutableArray alloc] initWithArray:arrayData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"identify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    User *user = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@_%@", user.name, user.address];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
