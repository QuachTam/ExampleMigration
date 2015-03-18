//
//  Doctor.h
//  ExampleMigration
//
//  Created by QSOFT on 3/18/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"

@class Contact;

@interface Doctor : BaseEntity

@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) Contact *contact;

@end
