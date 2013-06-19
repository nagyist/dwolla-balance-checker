//
//  CheckBalance.h
//  Dwolla Balance Checker
//
//  Created by Gordon on 5/10/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Dwolla/DwollaAPI.h"


// Encapsulates methods used to check balance and used in token storage
@interface CheckBalance : NSObject

+ (NSString *)fetchBalance;
+ (NSString *)getToken;
+ (void)setToken:(NSString *)token;

@end
