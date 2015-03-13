//
//  User.h
//  ExampleMigration
//
//  Created by QSOFT on 3/13/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"


@interface User : BaseEntity

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * name;

@end
