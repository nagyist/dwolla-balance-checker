//
//  PreferencesViewController.m
//  Dwolla Balance Checker
//
//  Created by Gordon on 6/10/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import "PreferencesViewController.h"

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
    NSTextField *token_input = [self.view viewWithTag:1];
    NSString *token = [token_input stringValue];
    [CheckBalance setToken:token];
    //[self.view.window close];
}

@end
