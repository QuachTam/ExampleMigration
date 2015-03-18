//
//  Contact.h
//  ExampleMigration
//
//  Created by QSOFT on 3/18/15.
//  Copyright (c) 2015 QSOFT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseEntity.h"

@class Communication, Doctor, Profile, Supplier;

@interface Contact : BaseEntity

@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * countryCode;
@property (nonatomic, retain) NSString * county;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) Doctor *doctor;
@property (nonatomic, retain) Profile *profile;
@property (nonatomic, retain) Supplier *supplier;
@property (nonatomic, retain) NSSet *communicationList;
@end

@interface Contact (CoreDataGeneratedAccessors)

- (void)addCommunicationListObject:(Communication *)value;
- (void)removeCommunicationListObject:(Communication *)value;
- (void)addCommunicationList:(NSSet *)values;
- (void)removeCommunicationList:(NSSet *)values;

@end
