//
//  MagicalRecord+Category.m
//  ExampleMigration
//
//  Created by QSOFT on 3/13/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import "MagicalRecord+Category.h"

@implementation MagicalRecord (Category)
+ (void)setupCustomMigrateCoreDataStackWithStoreName:(NSString *)storeName
{
    if ([NSPersistentStoreCoordinator MR_defaultStoreCoordinator] != nil) return;
    
    NSManagedObjectModel *model = [NSManagedObjectModel MR_defaultManagedObjectModel];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSDictionary *options = [[self class] customMigrationOptions];
    [coordinator MR_addSqliteStoreNamed:storeName withOptions:options];
    [NSPersistentStoreCoordinator MR_setDefaultStoreCoordinator:coordinator];
    
    [NSManagedObjectContext MR_initializeDefaultContextWithCoordinator:coordinator];
}

+ (void)setupCustomMigrateCoreDataStack
{
    [self setupCustomMigrateCoreDataStackWithStoreName:[self defaultStoreName]];
}

+ (NSDictionary *)customMigrationOptions
{
    NSMutableDictionary *sqliteOptions = [NSMutableDictionary dictionary];
    [sqliteOptions setObject:@"WAL" forKey:@"journal_mode"];
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption,
                             sqliteOptions, NSSQLitePragmasOption,
                             nil];
    return options;
}

@end
