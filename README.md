# dylib.io

## PROVIDE

* use dylib in osx develop dymanically
* reload/reconnnect the .dylib file runtime 

## HOW TO USE

```
DylibClient *client = [[DylibClient alloc] init];
NSString *path = @"PATH_TO_UR_LIB/libDylib1.dylib";
client.url = path;
[client connect];
[client notify:@"test" param1:@"11" param2:@"22"];

NSString *path2 = @"PATH_TO_UR_LIB/libDylib2.dylib";
client.url = path2;
[client reload];
[client notify:@"test" param1:@"11" param2:@"22"];

```
