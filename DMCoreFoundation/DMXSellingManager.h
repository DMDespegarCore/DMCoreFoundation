//
//  DMXSellingManager.h
//  DMDespegar
//
//  Created by Nicolas Miyasato on 7/15/15.
//  Copyright (c) 2015 Despegar.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMXSellingManager : NSObject

+ (instancetype) sharedManager;

// Genera info para hacer x-selling con hoteles a partir de la info del vuelo comprado.
- (void) boughtFlight:(NSDictionary *)flightInfo;

// Genera info para hacer x-selling con vuelos a partir de la info del hotel comprado.
- (void) boughtHotel:(NSDictionary *)hotelInfo;

@end
