//
//  PreferencesViewController.m
//  Dwolla Balance Checker
//
//  Created by Gordon on 6/10/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import "PreferencesViewController.h"

#define TOKEN_FIELD_TAG_NUM 1

@interface PreferencesViewController ()

@end

@implementation PreferencesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view.window setLevel:NSMainMenuWindowLevel];
    }
    return self;
}


- (IBAction)saveSettings:(id)sender {
    NSTextField *token_input = [self.view viewWithTag:TOKEN_FIELD_TAG_NUM];
    NSString *token = [token_input stringValue];
    [CheckBalance setToken:token];
}

@end
