//
//  AppDelegate.h
//  Dwolla Balance Checker
//
//  Created by Gordon on 5/9/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CheckBalance.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong, nonatomic) NSStatusItem *statusBar;

@property (assign) IBOutlet NSMenu *statusMenu;

@property (assign) NSWindowController *preferences;

- (void)refreshBalance;

@end
