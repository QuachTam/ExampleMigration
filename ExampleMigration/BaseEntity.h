//
//  BaseEntity.h
//  ExampleMigration
//
//  Created by QSOFT on 3/13/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BaseEntity : NSManagedObject

@property (nonatomic, retain) NSString * uuid;

@end
