//
//  TagsMigrationPolicy.m
//  ExampleMigration
//
//  Created by QSOFT on 3/17/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import "TagsMigrationPolicy.h"

@implementation TagsMigrationPolicy
- (BOOL)createDestinationInstancesForSourceInstance:(NSManagedObject *)sInstance entityMapping:(NSEntityMapping *)mapping manager:(NSMigrationManager *)manager error:(NSError *__autoreleasing *)error {
    if ([sInstance.entity.name isEqualToString:@"User"]) {
        NSManagedObjectContext *context = manager.destinationContext;
        
    }
    return YES;
}
@end
