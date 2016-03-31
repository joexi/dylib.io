//
//  AppDelegate.m
//  dylib.io
//
//  Created by 骏飞 奚 on 16/3/31.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "AppDelegate.h"
#import "DylibClient.h"
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate
DylibClient *client;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    client = [[DylibClient alloc] init];

    NSButton *btn = [[NSButton alloc] initWithFrame:NSMakeRect(0, 0, 150, 60)];
    [btn setTitle:@"lib1"];
    [btn setAction:@selector(lib1)];
    [self.window.contentView addSubview:btn];
    
    NSButton *btn2 = [[NSButton alloc] initWithFrame:NSMakeRect(200, 0, 150, 60)];
    [btn2 setTitle:@"lib2"];
    [btn2 setAction:@selector(lib2)];
    [self.window.contentView addSubview:btn2];
}

- (void)lib1 {
    NSString *path = @"/Users/junfeixi/dylib.io/dylib.io/libDylib1.dylib";
    client.url = path;
    [client reload];
    [client notify:@"test" param1:@"11" param2:@"22"];
}

- (void)lib2 {
    NSString *path = @"/Users/junfeixi/dylib.io/dylib.io/libDylib2.dylib";
    client.url = path;
    [client reload];
    [client notify:@"test" param1:@"11" param2:@"22"];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
