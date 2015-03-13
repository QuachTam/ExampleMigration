//
//  MagicalRecord+Category.h
//  ExampleMigration
//
//  Created by QSOFT on 3/13/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import <MagicalRecord/CoreData+MagicalRecord.h>

@interface MagicalRecord (Category)
+ (void)setupCustomMigrateCoreDataStackWithStoreName:(NSString *)storeName;
+ (void)setupCustomMigrateCoreDataStack;
@end
