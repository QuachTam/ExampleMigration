//
//  ViewController.m
//  ExampleMigration
//
//  Created by QSOFT on 3/13/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import "ViewController.h"
#import <CoreData+MagicalRecord.h>
#import "Contact.h"
#import "Supplier.h"
#import "Profile.h"
#import "Doctor.h"
//#import "Personal.h"
#import "Communication.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) NSMutableArray *arraySupplier;
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
    NSArray *arrayData = [Profile MR_findAllInContext:[NSManagedObjectContext MR_defaultContext]];
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"uuid=%ld", arrayData.count+1];
        Profile *profile = [Profile MR_findFirstWithPredicate:predicate inContext:localContext];
        if (!profile) {
            profile = [Profile MR_createInContext:localContext];
            profile.uuid = [NSString stringWithFormat:@"%ld", (long)arrayData.count];
            profile.email = [NSString stringWithFormat:@"email %ld", (long)arrayData.count];
//            profile.city  = [NSString stringWithFormat:@"profile city %ld", (long)arrayData.count];
//            
//            Supplier *supplier = [Supplier MR_createInContext:localContext];
//            supplier.city = [NSString stringWithFormat:@"supplier city %ld", (long)arrayData.count];
        }
    }];
    NSArray *arrayDataFind = [Profile MR_findAllSortedBy:@"uuid" ascending:YES inContext:[NSManagedObjectContext MR_defaultContext] ];
    [self.array removeAllObjects];
    self.array = [NSMutableArray arrayWithArray:arrayDataFind];
    
    NSArray *arrayDataSupplier = [Supplier MR_findAllSortedBy:@"uuid" ascending:YES inContext:[NSManagedObjectContext MR_defaultContext] ];
    self.arraySupplier = [NSMutableArray arrayWithArray:arrayDataSupplier];
    [self.tbView reloadData];
}

- (void)getDataBase {
    NSArray *arrayData = [Profile MR_findAllSortedBy:@"uuid" ascending:YES inContext:[NSManagedObjectContext MR_defaultContext] ];
    NSArray *arrayDataSupplier = [Supplier MR_findAllSortedBy:@"uuid" ascending:YES inContext:[NSManagedObjectContext MR_defaultContext] ];
    self.array = [[NSMutableArray alloc] initWithArray:arrayData];
    self.arraySupplier = [[NSMutableArray alloc] initWithArray:arrayDataSupplier];
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
    Profile *user = [self.array objectAtIndex:indexPath.row];
    Supplier *supplier = [self.arraySupplier objectAtIndex:indexPath.row];
    NSArray *arrayCommunication = [user.contact.communicationList allObjects];
    Communication *commu = [arrayCommunication firstObject];
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@", user.email, user.city, supplier.city];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@", user.email, user.contact.city, supplier.contact.city];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@ - %@", user.email, user.contact.city, supplier.contact.city, user.contact.email];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@ - %@ - %@", user.email, user.contact.city, supplier.contact.city, commu.email];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
