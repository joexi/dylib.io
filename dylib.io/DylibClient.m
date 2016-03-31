//
//  DylibClient.m
//  dylib.io
//
//  Created by 骏飞 奚 on 16/3/31.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import "DylibClient.h"
#include <dlfcn.h>
#import <mach-o/dyld.h>
@implementation DylibClient

- (id)init {
    self = [super init];
    if (self) {
    }
    return self;
}
void voidTest(){};

- (void)dealloc {

}

//- ()

#pragma public method

- (BOOL)connect {
   
    if (self.url == nil) {
        return NO;
    }
    if (_libHandler != nil) {
        dlclose(_libHandler);
    }
    _libHandler = dlopen([self.url cStringUsingEncoding:NSUTF8StringEncoding], RTLD_NOW | RTLD_NODELETE);
    if (_libHandler != nil) {
        return YES;
    }
    return NO;
}

- (BOOL)reconnect {
    return [self disconnect] && [self connect];
}

- (BOOL)disconnect {
    if (_libHandler != nil) {
        int result = dlclose(_libHandler);
        _libHandler = nil;
        return result != 0;
    }
    return YES;
}

- (BOOL)reload {
    if (_libHandler != nil) {
        int result = 0;
        do {
            result = dlclose(_libHandler);
        } while (result == 0);
        _libHandler = nil;
    }
    return [self connect];
}

void *(*func)(id param, ...);

- (id)excute:(NSString *)funcName param1:(id)param1 param2:(id)param2 param3:(id)param3 {
    if (_libHandler == nil) {
        return NO;
    }
    func = (dlsym(_libHandler, [funcName cStringUsingEncoding:NSUTF8StringEncoding]));
    
    return (__bridge id)(func(param1, param2, param3));
}

- (id)excute:(NSString *)funcName param1:(id)param1 param2:(id)param2 {
    if (_libHandler == nil) {
        return NO;
    }
    func = (dlsym(_libHandler, [funcName cStringUsingEncoding:NSUTF8StringEncoding]));
    return (__bridge id)(func(param1, param2));
}

- (id)excute:(NSString *)funcName param1:(id)param1 {
    if (_libHandler == nil) {
        return NO;
    }
    func = (dlsym(_libHandler, [funcName cStringUsingEncoding:NSUTF8StringEncoding]));
    return (__bridge id)(func(param1));
}

- (void)notify:(NSString *)funcName param1:(id)param1 param2:(id)param2 param3:(id)param3 {
    if (_libHandler == nil) {
        return;
    }
    func = (dlsym(_libHandler, [funcName cStringUsingEncoding:NSUTF8StringEncoding]));
    func(param1, param2, param3);
}


- (void)notify:(NSString *)funcName param1:(id)param1 param2:(id)param2 {
    if (_libHandler == nil) {
        return;
    }
    func = (dlsym(_libHandler, [funcName cStringUsingEncoding:NSUTF8StringEncoding]));
    func(param1, param2);
}

- (void)notify:(NSString *)funcName param1:(id)param1 {
    if (_libHandler == nil) {
        return;
    }
    func = (dlsym(_libHandler, [funcName cStringUsingEncoding:NSUTF8StringEncoding]));
    func(param1);
}

@end
