//
//  CheckBalance.m
//  Dwolla Balance Checker
//
//  Created by Gordon on 5/10/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import "CheckBalance.h"

@implementation CheckBalance

// set OAuth Token as a key in NSUserDefaults (warning: this is not the safest way to go about storing credentials!):
+ (void)setToken:(NSString *)token {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:token forKey:@"token"];
    [settings synchronize];
}

// get previously saved OAuth Token.  Returns nil if not found.:
+ (NSString *)getToken {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"token"];
}

// returns user balance as string using previously saved OAuth token.  uses DwollaAPI library.  returns error message if failure
+ (NSString *)fetchBalance {
    DwollaAPI *client = [[DwollaAPI alloc] init];
    NSString *accesstoken = [self getToken];
    
    if (accesstoken != nil) {
        [client setAccessToken:accesstoken];
        
        // in case balance call fails, perhaps due to invalid token catch exception:
        @try {
            return [[NSString alloc] initWithFormat:@"$%.2f", [client getBalance]];
        }
        @catch (NSException *exception) {
            return @"Bad token?";
        }
        
    }
    
    else return @"No Token";
}

@end
