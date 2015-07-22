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
    // La idea acá es generar el deeplink correspondiente con todos los viewControllers que
    // van a ser pusheados
    // También hay se generan los diccionarios (aunque puden ser clases serializables)
    // necesarios para poder ser configurados.
    DPLMutableDeepLink *link = [[DPLMutableDeepLink alloc] initWithString:@"despe://home/hotel"];
    
    // Esta es la info que se usa para configurar los VCs
    link[@"viewControllersInfo"] = @[hotelInfo, hotelInfo];
    link[@"viewControllers"] = @[@"DMFlightsSearchViewController", @"DMFlightsResultsViewController"];
    link[@"storyboardName"] = @"DMFlightsMain";
    
    // También hay que ver el caso en el cual no hay StoryBoards.
    
    if ([[UIApplication sharedApplication] canOpenURL:link.URL]) {
        [[UIApplication sharedApplication] openURL:link.URL];
    }
    

    
}

@end
