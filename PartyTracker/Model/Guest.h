//
//  Guest.h
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 18/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Party;

@interface Guest : NSManagedObject

@property (nonatomic, retain) NSString * guestName;
@property (nonatomic, retain) NSSet *guestdetails;
@end

@interface Guest (CoreDataGeneratedAccessors)

- (void)addGuestdetailsObject:(Party *)value;
- (void)removeGuestdetailsObject:(Party *)value;
- (void)addGuestdetails:(NSSet *)values;
- (void)removeGuestdetails:(NSSet *)values;

@end
