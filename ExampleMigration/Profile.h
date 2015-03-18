//
//  Profile.h
//  ExampleMigration
//
//  Created by QSOFT on 3/18/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"

@class Personal;

@interface Profile : BaseEntity

@property (nonatomic, retain) NSString * countryCodeOfPrefixPhone;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) Personal *contact;

@end
