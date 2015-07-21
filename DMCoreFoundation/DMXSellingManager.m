//
//  DMXSellingManager.m
//  DMDespegar
//
//  Created by Nicolas Miyasato on 7/15/15.
//  Copyright (c) 2015 Despegar.com. All rights reserved.
//

#import "DMXSellingManager.h"
#import <DeepLinkKit/DeepLinkKit.h>

@implementation DMXSellingManager

+(instancetype) sharedManager {
    static dispatch_once_t onceToken;
    static DMXSellingManager *mngr = nil;
    dispatch_once(&onceToken, ^{
        mngr = [[DMXSellingManager alloc] init];
    });
    
    return mngr;
}

- (void) boughtFlight:(NSDictionary *)flightInfo {
    NSLog(@"Bought flight %@", flightInfo);
}

- (void) boughtHotel:(NSDictionary *)hotelInfo {
    
    DPLMutableDeepLink *link = [[DPLMutableDeepLink alloc] initWithString:@"despe://home/hotel"];
    link[@"searchParams"] = hotelInfo;
    link[@"viewController"] = @"DMFlightsSearchViewController";
    link[@"storyboardName"] = @"DMFlightsMain";
    
    if ([[UIApplication sharedApplication] canOpenURL:link.URL]) {
        [[UIApplication sharedApplication] openURL:link.URL];
    }
    

    
}

@end
