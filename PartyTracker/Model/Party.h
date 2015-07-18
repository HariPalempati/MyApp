//
//  Party.h
//  PartyTracker
//
//  Created by Hari Krishna Palempati on 17/07/15.
//  Copyright (c) 2015 edu.Sysintelli.ios.hari. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Party : NSManagedObject

@property (nonatomic, retain) NSString * partyName;
@property (nonatomic, retain) NSString * partyTime;
@property (nonatomic, retain) NSString * partyLocation;
@property (nonatomic, retain) NSString * partyGuests;

@end
