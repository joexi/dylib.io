//
//  DylibClient.h
//  dylib.io
//
//  Created by 骏飞 奚 on 16/3/31.
//  Copyright © 2016年 骏飞 奚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DylibClient : NSObject
{
    void *_libHandler;
}
@property (nonatomic, strong) NSString *url;




- (BOOL)connect;

- (BOOL)reconnect;

- (BOOL)disconnect;

- (BOOL)reload;


- (id)excute:(NSString *)funcName param1:(id)param1 param2:(id)param2 param3:(id)param3;
- (id)excute:(NSString *)funcName param1:(id)param1 param2:(id)param2;
- (id)excute:(NSString *)funcName param1:(id)param1;


- (void)notify:(NSString *)funcName param1:(id)param1 param2:(id)param2 param3:(id)param3;
- (void)notify:(NSString *)funcName param1:(id)param1 param2:(id)param2;
- (void)notify:(NSString *)funcName param1:(id)param1;
@end