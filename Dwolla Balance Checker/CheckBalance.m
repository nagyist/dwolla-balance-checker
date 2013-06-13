//
//  CheckBalance.m
//  Dwolla Balance Checker
//
//  Created by Gordon on 5/10/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import "CheckBalance.h"

@implementation CheckBalance

+ (void)setToken:(NSString *)token {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:token forKey:@"token"];
    [settings synchronize];
}

+ (NSString *)getToken {
    NSUserDefaults *settings = [NSUserDefaults standardUserDefaults];
    return [settings objectForKey:@"token"];
}

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
    
    else return @"No Token Set";
}

@end
