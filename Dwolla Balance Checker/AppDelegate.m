//
//  AppDelegate.m
//  Dwolla Balance Checker
//
//  Created by Gordon on 5/9/13.
//  Copyright (c) 2013 Gordon. All rights reserved.
//

#import "AppDelegate.h"

// Delay before app checks for balance again, in seconds:
#define REFRESH_TIME_SECONDS 60

@implementation AppDelegate

@synthesize statusMenu = _statusMenu;
@synthesize statusBar = _statusBar;


// as soon as application finishes launching, set up timer to refresh balance periodically:
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [NSTimer scheduledTimerWithTimeInterval:REFRESH_TIME_SECONDS target:self selector:@selector(refreshBalance) userInfo:nil repeats:YES];
}

// as soon as main menu is displayed, initialize statusbar and attach our menu to it
- (void) awakeFromNib {
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    [self refreshBalance];
    
    self.statusBar.menu = self.statusMenu;
    self.statusBar.highlightMode = YES;
    
    self.preferences = [[NSWindowController alloc] initWithWindowNibName:@"PreferencesWindow"];
}

// handles Quit menu button; quits app immediately when message received (when method called)
- (IBAction)quit:(id)sender {
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}

// updates balance at status bar title
- (void)refreshBalance {
    self.statusBar.title = [CheckBalance fetchBalance];
}

// handles Refresh menu button, updates balance
- (IBAction)refresh:(id)sender {
    [self refreshBalance];
}

// handles Preferences menu button; when called, focuses on existing prefences window.  If initial preferences window is closed, instantiate a new preferences window
- (IBAction)openPreferences:(id)sender {
    [self.preferences showWindow:self.preferences.window];
    [self.preferences.window setLevel:NSMainMenuWindowLevel];
    if (!self.preferences.window) {
        self.preferences = [[NSWindowController alloc] initWithWindowNibName:@"PreferencesWindow"];
    }
}
@end
