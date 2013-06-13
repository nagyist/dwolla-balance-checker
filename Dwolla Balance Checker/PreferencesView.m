//
//  PreferencesView.m
//  Dwolla Balance Checker
//
//  Created by Gordon on 6/10/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import "PreferencesView.h"

#define TOKEN_FIELD_TAG_NUM 1

@implementation PreferencesView

- (void) awakeFromNib {
    NSTextField *token_input = [self viewWithTag:TOKEN_FIELD_TAG_NUM];
    NSString *saved_token = [CheckBalance getToken];
    if (saved_token != nil) {
        [token_input setStringValue:saved_token];
    }
    
}

@end
