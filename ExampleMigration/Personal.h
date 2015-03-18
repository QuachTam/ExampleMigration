//
//  Personal.h
//  ExampleMigration
//
//  Created by QSOFT on 3/18/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"

@class Doctor, Profile, Supplier;

@interface Personal : BaseEntity

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * countryCode;
@property (nonatomic, retain) NSString * county;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) Profile *profile;
@property (nonatomic, retain) Doctor *doctor;
@property (nonatomic, retain) Supplier *supplier;

@end
