//
//  AppDelegate.m
//  Dwolla Balance Checker
//
//  Created by Gordon on 5/9/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize statusMenu = _statusMenu;
@synthesize statusBar = _statusBar;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // set up timer:
    [NSTimer scheduledTimerWithTimeInterval:60 target:self selector:@selector(refreshBalance) userInfo:nil repeats:YES];
}

- (void) awakeFromNib {
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [self refreshBalance];
    
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;
    
    self.preferences = [[NSWindowController alloc] initWithWindowNibName:@"PreferencesWindow"];
}

- (IBAction)quit:(id)sender {
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}

- (void)refreshBalance {
    self.statusBar.title = [CheckBalance fetchBalance];
}

- (IBAction)refresh:(id)sender {
    [self refreshBalance];
}

- (IBAction)openPreferences:(id)sender {
    [self.preferences showWindow:self.preferences.window];
    [self.preferences.window setLevel:NSMainMenuWindowLevel];
    if (!self.preferences.window) {
        self.preferences = [[NSWindowController alloc] initWithWindowNibName:@"PreferencesWindow"];
    }
}
@end
